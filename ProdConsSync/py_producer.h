//
// Created by ubuntu on 18/02/18.
//

#ifndef PRODCONSSYNC_PY_PRODUCER_H
#define PRODCONSSYNC_PY_PRODUCER_H

#include <errno.h>
#include<string.h>
#include <sys/time.h>

#include<sys/socket.h>
#include<arpa/inet.h> //inet_addr

#include "includes.h"
#include "producer.h"

int fork_py_prod();

#endif //PRODCONSSYNC_PY_PRODUCER_H
