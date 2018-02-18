#!/usr/bin/env python

import socket
import sys
import os
import signal
import time

index = 0
next = False

def sig_handlr(signum, frame):
    global index
    global next

    next = True
    lst_len = len(fnames_lst)
    index += 1
    if index == lst_len:
        index = 0


def process_file(file):
    global next
    for line in open(file):
        if next:
            print "@ got signal... moving to next file!!!! @"
            try:
                sys.stdout.flush()
            except IOError:
                print "@ flush error @"
                pass
            time.sleep(10)
            break
        print line
        try:
            sys.stdout.flush()
        except IOError:
            print "@ flush error @"
            pass
        time.sleep(2)


TCP_IP = '127.0.0.1'
TCP_PORT = 8888
BUFFER_SIZE = 1024
MESSAGE = "O.K!"

#print "Hello python client :)"

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sock.connect((TCP_IP, TCP_PORT))

# get list of files names
fnames_lst = [];
file_name = sock.recv(BUFFER_SIZE)
while(file_name != 'FIN'):
    fnames_lst.append(file_name)
    sock.send(MESSAGE)
    file_name = sock.recv(BUFFER_SIZE)

# send my pid to the server
sock.send(str(os.getpid()))

# set signal handler
signal.signal(signal.SIGUSR1, sig_handlr)

while True:
    next = False
    process_file(fnames_lst[index])

sys.stdout.flush()
sock.close()
