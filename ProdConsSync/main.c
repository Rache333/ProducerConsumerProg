#include <sys/types.h>

#include "includes.h"
#include "producer.h"
#include "consumer.h"
#include "proc_handler.h"
#include "py_producer.h"


int main(int argc, char * argv[]) {
    printf("\n**** Producer-Consumer Synchronization Lab! ****\n\n");

    int c, num_of_prod = 2, num_of_cons = 3;
    if(argc == 1)
    {
        puts("run on default mode :");
    }

    opterr = 0;
    while ( (c = getopt(argc, argv, "p:c:")) != EOF )
    {
        switch(c) {
            case 'p':
                num_of_prod = atoi(optarg);
                break;
            case 'c':
                num_of_cons = atoi(optarg);
                break;
            case '?':
                fprintf(stderr,"Unknown option %c\n", optopt);
                printf("ArgumentsError: please enter the arguments in following form "
                               "-p <numberOfProducers> -c <numberOfConsumers>\n");
                exit(EXIT_FAILURE);
        }
    }

    printf("%d producers and %d consumers\n\n", num_of_prod, num_of_cons);

    int md;
    Shared_mem * shmem;

    /* Create shared memory object */
    md = shm_open("/shmem", O_TRUNC|O_CREAT|O_RDWR, 0660);
    ftruncate(md, sizeof(Shared_mem));
    shmem = mmap(0, sizeof(Shared_mem), PROT_WRITE|PROT_READ, MAP_SHARED, md, 0);

    // initial the producer semaphore to LEN
    sem_init(&shmem->sem_prod, 1, LEN);
    // initial the consumer semaphore to zero
    sem_init(&shmem->sem_cons, 1, 0);

    // initialize access mutex
    pthread_mutex_init(&shmem->mutex_access, NULL);

    shmem->prod_index = 0;
    shmem->cons_index = 0;

    // for random correctly
    srand((unsigned int) time(NULL));

    int ret;

    // create producers child processes
    pid_t pids_prods[num_of_prod];
    ret = fork_childs("Producers", (pid_t *) &pids_prods, num_of_prod, (void (*)(void *)) &producer);
    if(ret == EXIT_FAILURE) {
        puts("Failed create producers child processes");
        return EXIT_FAILURE;
    }

    // create unique producer to communicate with python program
    ret = fork_py_prod();
    if(ret == EXIT_FAILURE) {
        return EXIT_FAILURE;
    }

    // create consumers child processes
    pid_t pids_cons[num_of_cons];
    ret = fork_childs("Consumers", (pid_t *) &pids_cons, num_of_cons, (void (*)(void *)) &consumer);
    if(ret == EXIT_FAILURE) {
        puts("Failed create consumers child processes");
        return EXIT_FAILURE;
    }

    // wait for producers child processes to finish
    ret = wait_childs("Producers", (pid_t *) &pids_prods, num_of_prod);
    if(ret == EXIT_FAILURE) {
        puts("Failed wait for producers child processes");
        return EXIT_FAILURE;
    }

    // wait for consumers child processes to finish
    ret = wait_childs("Consumers", (pid_t *) &pids_cons, num_of_cons);
    if(ret == EXIT_FAILURE) {
        puts("Failed wait for consumers child processes");
        return EXIT_FAILURE;
    }

    unlinkShmem(shmem, md);

    return EXIT_SUCCESS;

}