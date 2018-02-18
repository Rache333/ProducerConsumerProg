//
// Created by ubuntu on 11/02/18.
//

#include "consumer.h"

void *consumer(void * p)
{
    int * num = (int *) p;
    printf("Consumer number %d\n", *num);

    int md, val;
    Shared_mem * shmem;

    /* Connect to shared memory object */
    md = shm_open("/shmem", O_RDWR,0);
    shmem = mmap(0, sizeof(Shared_mem), PROT_WRITE|PROT_READ, MAP_SHARED, md, 0);


    while(END_OF_TIME) {
        sleep(5);

        // wait to have at least one question to read
        sem_wait(&shmem->sem_cons);

        sem_getvalue(&shmem->sem_cons, &val);
        printf("cons sem val=%d\n", val);
        sleep(1);

        //lock to access the questions array
        pthread_mutex_lock(&shmem->mutex_access);

        printf("Consumer number %d gets the lock!\n", *num);

        int index = shmem->cons_index;
        Question q = shmem->quest_arr[index];
        printf("read question number %d\n", index);

        index++;
        if(index == LEN)
        {
            index = 0;
        }
        shmem->cons_index = index;

        pthread_mutex_unlock(&shmem->mutex_access);

        // increment the producer semaphore
        sem_post(&shmem->sem_prod);


        double solution = solve(q.num1, q.num2, q.op);
        if (solution != -1) {
            printf("the solution is %lf\n", solution);
        }
    }
    return NULL;
}