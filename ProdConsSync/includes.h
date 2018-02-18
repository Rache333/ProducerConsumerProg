//
// Created by ubuntu on 11/02/18.
//

#ifndef PRODCONSSYNC_INCLUDES_H
#define PRODCONSSYNC_INCLUDES_H

#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <semaphore.h>
#include <pthread.h>
#include <sys/mman.h>
#include <sys/stat.h>        /* For mode constants */
#include <fcntl.h>           /* For O_* constants */
#include <sys/types.h>
#include <sys/wait.h>


#define LEN 10
#define LOW 0
#define HIGH 10
#define END_OF_TIME 1

typedef enum oper {PLUS=0, MIN, MUL, DIV} Oper;

typedef struct question{
    double num1;
    double num2;
    Oper   op;
} Question;

typedef struct shared_mem
{
    // indicate how many questions can be produced
    sem_t sem_prod;
    // indicate how many questions can be consumed
    sem_t sem_cons;
    pthread_mutex_t mutex_access;
    int prod_index;
    int cons_index;
    Question quest_arr[LEN];

} Shared_mem;

#endif //PRODCONSSYNC_INCLUDES_H
