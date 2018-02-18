//
// Created by ubuntu on 11/02/18.
//

#include "includes.h"
#include "quest_arr_handler.h"


int getRandom(int low, int high)
{
    return (rand() %(high + 1 - low)) +low;
}

double solve(double n1, double n2, Oper o)
{
    switch(o)
    {
        case PLUS:
            printf("%lf PLUS %lf\n", n1, n2);
            return n1+n2;
        case MIN:
            printf("MIN of %lf and %lf\n", n1, n2);
            return (n1<n2)?n1:n2;
        case MUL:
            printf("%lf MUL %lf\n", n1, n2);
            return n1*n2;
        case DIV:
            printf("%lf DIV %lf\n", n1, n2);
            return (n2!=0)?(n1/n2):0;
    }
    printf("error quest!\nn1=%lf n2=%lf op=%d\n",n1,n2,o);
    return -1;
}