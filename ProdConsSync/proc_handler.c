//
// Created by ubuntu on 11/02/18.
//

#include "proc_handler.h"

// function fork group of child processes, make each new process run func, and
// update pids_arr with the new pids
int fork_childs(char * str, pid_t *pids_arr, int len, void (*func)(void * p))
{
    pid_t pid;
    int num;
    for(int i=0; i<len; i++)
    {
        pid = fork();
        if(pid == 0)
        {
            num = i+1;
            func(&num);
            exit(0);
        } else if(pid > 0) {

            pids_arr[i] = pid;
        } else {
            // fork failed
            printf("%s - fork number %d failed\n", str, i);
            return EXIT_FAILURE;
        }
    }

}

int findpid(pid_t *arr, int len, int pid)
{
    for(int i=0; i<len; i++)
    {
        if(arr[i] == pid)
            return i;
    }
    return EXIT_FAILURE;
}

int wait_childs(char * str, pid_t *pids_arr, int len)
{
    pid_t pid;
    int status,pos;
    while(1)
    {
        pid = wait(&status);
        pos = findpid(pids_arr,len,pid);
        if(pos == EXIT_FAILURE) {
            return EXIT_FAILURE;
        }
        printf("%s - child process number %d pid = %d\n", str, pos, pid);
        printf("exist with status of %d\n", WEXITSTATUS(status));
    }
    return EXIT_SUCCESS;
}