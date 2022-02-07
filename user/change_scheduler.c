#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"
#include "kernel/fs.h"
//#include <string.h>

int
main(int args, char *argv[])
{
    if(argv[1]){
        changeSchedulingAlgorithm(argv[1]);
        exit(0);
    }
    else{
        printf("Not enough parameters \n");
        exit(-2);
    }

}


