//
// Created by ubuntu on 11/02/18.
//

#ifndef PRODCONSSYNC_PRODUCER_H
#define PRODCONSSYNC_PRODUCER_H

#include "includes.h"
#include "quest_arr_handler.h"

void *producer(void * p);

Shared_mem * connectToShmem(int * md);

void update_new_quest(Question * q, Shared_mem * shmem, int pnum);

void unlinkShmem(Shared_mem * shmem, int md);

#endif //PRODCONSSYNC_PRODUCER_H
