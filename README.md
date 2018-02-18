# ProducerConsumerProg
http://devarea.com/lab-threads-and-synchronization/#.WooCEpNubyJ

--------------------------
on linux,
go to cmake-build-debug
# make
# ./ProdConsSync

--------------------------
program arguments : -p <number of producers> -c <number of consumers>
for example: -p 3 -c 4
--------------------------
default values:
X=2
Y=3
LEN=10
--------------------------

The program forks X producer and Y consumers.
Each producer creates a random question and update in a
 shared memory, which holds an array of LEN questions.

In addition, the program fork "py_producer" - a producer which takes its
questions from python program via pipe.

First, py_producer is used as a server and send to the client python process a
list of file names. At the end, the python process send its pid to the server.

Then, sockets are closed and the communication is made via pipe.

The python program sends each line from each file, and the py_producer process the
line to a question, and update in the shared memory.

On randomly ocasion, the py_producer sends a signal to the
 python program, indicates to move to the next file.

All the above done in full synchronization, and with handling errors correctly.
--------------------------

requirements:
all the below need to be in the same directory of the executable file.

client.py
file1.txt
file2.txt
file3.txt

--------------------------


