//
// Created by ubuntu on 11/02/18.
//

#ifndef PRODCONSSYNC_PROC_HANDLER_H
#define PRODCONSSYNC_PROC_HANDLER_H

#include "includes.h"

int fork_childs(char * str, pid_t *pids_arr, int len, void (*func)(void * p));

int findpid(pid_t *arr, int len, int pid);

int wait_childs(char * str, pid_t *pids_arr, int len);

#endif //PRODCONSSYNC_PROC_HANDLER_H
