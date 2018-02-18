#include "py_producer.h"

#define PORT 8888

int CLIENT_PID;

/* write mssg to socket fd */
int write_mssg(int fd, char * mssg, int len)
{
    if(write(fd, mssg, len) == -1)
    {
        printf("Could not write to client socket. error: %s\n", strerror(errno));
        return EXIT_FAILURE;
    }
    return EXIT_SUCCESS;
}

/* read mssg from socket fd */
int read_mssg(int fd)
{
    char recv_bytes[256];
    memset(&recv_bytes, 0, sizeof(recv_bytes));
    int num_of_read_bytes = 0;
    if((num_of_read_bytes = read(fd, recv_bytes, sizeof(recv_bytes))) == -1)
    {
        printf("Could not read from client socket. error: %s\n", strerror(errno));
        return EXIT_FAILURE;
    }
    if(num_of_read_bytes == 0)
    {
        puts("Client disconnected");
        fflush(stdout);
    }
    return EXIT_SUCCESS;
}

/* read python client pid from socket fd */
int read_client_pid(int fd)
{
    char recv_bytes[256];
    memset(&recv_bytes, 0, sizeof(recv_bytes));
    int num_of_read_bytes = 0;
    if((num_of_read_bytes = read(fd, recv_bytes, sizeof(recv_bytes))) == -1)
    {
        printf("Could not read pid from client socket. error: %s\n", strerror(errno));
        return EXIT_FAILURE;
    }

    if(num_of_read_bytes == 0)
    {
        puts("Client disconnected");
        fflush(stdout);
    }
    return atoi(recv_bytes);
}

/* read lines from pipe with python program
 * process each line to a question, and
 * update shared memory
 */
void read_pipe(FILE * fp, Shared_mem * shmem)
{
    char *ln = NULL;
    size_t len = 0;

    while (getline(&ln, &len, fp) != -1)
    {
        /* skip lines of insufficient length or
         * lines begin with @
         */
        if(strlen(ln) < 5 || ln[0] == '@')
        {
            printf("... %s ...\n", ln);
            continue;
        }
        // parse question string
        Question q;
        char * end;
        q.num1 = strtod(ln, &end);
        q.num2 = strtod(end, &end);
        q.op = atoi(end);

        // update shared memory with the new question
        puts("py producer update shared memory...");
        update_new_quest(&q, shmem, 0);

        //send signal on random rate
        if(rand() % 20 == 0)
        {
            puts("sending signal to python...");
            kill(CLIENT_PID, SIGUSR1);
        }
        sleep(5);
    }
    free(ln);
}

void close_all(int fd_server, int fd_client, FILE * fp)
{
    close(fd_client);
    close(fd_server);
    pclose(fp);
}

/* unique producer which communicate with python program */
void *py_producer(void *p)
{
    int fd_server_sock, fd_client_sock;
    struct sockaddr_in server, client;

    //Create server socket
    fd_server_sock = socket(AF_INET , SOCK_STREAM , 0);
    if (fd_server_sock == -1)
    {
        printf("Could not create server socket. error: %s\n", strerror(errno));
        close(fd_server_sock);
        exit(EXIT_FAILURE);
    }
    puts("Server socket created");

    //Prepare the sockaddr_in structure
    memset(&server, 0, sizeof(server));
    server.sin_family = AF_INET;
    server.sin_addr.s_addr = INADDR_ANY;
    server.sin_port = htons(PORT);

    if (setsockopt(fd_server_sock, SOL_SOCKET, SO_REUSEADDR, &(int){ 1 }, sizeof(int)) == -1)
    {
        printf("setsockopt(SO_REUSEADDR) failed. error: %s\n", strerror(errno));
        close(fd_server_sock);
        exit(EXIT_FAILURE);
    }

    //Bind the server fd with its struct
    if(bind(fd_server_sock,(struct sockaddr *)&server , sizeof(server)) == -1)
    {
        printf("Could not bind server socket. error: %s\n", strerror(errno));
        close(fd_server_sock);
        exit(EXIT_FAILURE);
    }
    puts("server bind done");

    //Listen
    if(listen(fd_server_sock , 1) == -1)
    {
        printf("Could not listen on server socket. error: %s\n", strerror(errno));
        close(fd_server_sock);
        exit(EXIT_FAILURE);
    }

    //Accept and incoming connection
    puts("Waiting for incoming connections...");

    //create pipe stream with the python process
    const char * command = "python ./client.py";
    FILE * fp = popen(command, "r");
    if(fp == NULL)
    {
        fprintf(stderr, "Could not open pipe.\n");
        pclose(fp);
        close(fd_server_sock);
        exit(EXIT_FAILURE);
    }

    //accept connection from an incoming client
    int addrlen = sizeof(struct sockaddr_in);
    memset(&client, 0, sizeof(client));
    fd_client_sock = accept(fd_server_sock, (struct sockaddr *)&client, (socklen_t*)&addrlen);
    if (fd_client_sock == -1)
    {
        printf("Could not accept client socket. error: %s\n", strerror(errno));
        close_all(fd_server_sock, fd_client_sock, fp);
        exit(EXIT_FAILURE);
    }
    puts("Connection accepted");

    //Send a list of files names to the client
    int ret;
    char * files_lst[] = {"file1.txt", "file2.txt", "file3.txt"};
    int lst_len = sizeof(files_lst)/ sizeof(files_lst[0]);
    for(int i=0; i<lst_len; i++)
    {
        printf("send to python %s\n", files_lst[i]);

        ret = write_mssg(fd_client_sock, files_lst[i], strlen(files_lst[i]));
        if(ret == EXIT_FAILURE)
        {
            close_all(fd_server_sock, fd_client_sock, fp);
            exit(EXIT_FAILURE);
        }

        //Receive an O.K from client
        ret = read_mssg(fd_client_sock);
        if(ret == EXIT_FAILURE)
        {
            close_all(fd_server_sock, fd_client_sock, fp);
            exit(EXIT_FAILURE);
        }
    }

    /* send finish message */
    char * fin_mssg = "FIN";
    ret = write_mssg(fd_client_sock, fin_mssg, strlen(fin_mssg));
    if(ret == EXIT_FAILURE)
    {
        close_all(fd_server_sock, fd_client_sock, fp);
        exit(EXIT_FAILURE);
    }

    /* receive the client pid */
    ret = read_client_pid(fd_client_sock);
    if(ret == EXIT_FAILURE)
    {
        close_all(fd_server_sock, fd_client_sock, fp);
        exit(EXIT_FAILURE);
    }
    printf("python client pid = %d\n", ret);
    CLIENT_PID = ret;

    close(fd_client_sock);
    close(fd_server_sock);

    int md;
    Shared_mem * shmem = connectToShmem(&md);

    //get data from pipe
    puts("get data from pipe");
    read_pipe(fp, shmem);

    pclose(fp);
    unlinkShmem(shmem, md);
}

int fork_py_prod()
{
    pid_t pid = fork();
    if(pid == 0)
    {
        py_producer(NULL);
        exit(0);
    } else if(pid > 0) {

        return pid;

    } else {
        // fork failed
        puts("fork python producer failed");
        return EXIT_FAILURE;
    }
}