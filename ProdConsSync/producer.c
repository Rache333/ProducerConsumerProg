//
// Created by ubuntu on 11/02/18.
//

#include "producer.h"

#define PORT 5555

Shared_mem * connectToShmem(int * md)
{
    Shared_mem * shmem;

    /* Connect to shared memory object */
    *md = shm_open("/shmem", O_RDWR,0);
    shmem = mmap(0, sizeof(Shared_mem), PROT_WRITE|PROT_READ, MAP_SHARED, *md, 0);

    return shmem;
}

// q is the new question to update
// shmem to access the shared memory
// pnum is the producer number for identification
void update_new_quest(Question * q, Shared_mem * shmem, int pnum)
{
    int val;

    //wait to free space in the array to update the question
    sem_wait(&shmem->sem_prod);

    sem_getvalue(&shmem->sem_prod, &val);
    printf("prod sem val=%d\n", val);
    sleep(1);

    //lock to access the questions array
    pthread_mutex_lock(&shmem->mutex_access);
    printf("Producer number %d gets the lock!\n", pnum);

    int index = shmem->prod_index;
    // update new question in the array
    shmem->quest_arr[index] = *q;
    printf("updated question number %d\n", index);
    index++;
    if(index == LEN)
    {
        index = 0;
    }
    shmem->prod_index = index;

    pthread_mutex_unlock(&shmem->mutex_access);

    // increment the consumer semaphore
    sem_post(&shmem->sem_cons);

}

void unlinkShmem(Shared_mem * shmem, int md)
{
    int status;
    long pg_size;
    status = munmap(shmem, pg_size);  /* Unmap the page */
    status = close(md);                   /*   Close file   */
    status = shm_unlink("/shmem"); /* Unlink shared-memory object */

}

void *producer(void * p)
{
    int * num = (int *) p;
    printf("Producer number %d\n", *num);

    int md;
    Shared_mem * shmem = connectToShmem(&md);

    while(END_OF_TIME) {
        sleep(10);

        Question q;
        q.num1 = (double) getRandom(LOW, HIGH);
        q.num2 = (double) getRandom(LOW, HIGH);
        q.op = (Oper) getRandom(0, 3);

        update_new_quest(&q, shmem, *num);
    }

    unlinkShmem(shmem, md);

    return NULL;
}