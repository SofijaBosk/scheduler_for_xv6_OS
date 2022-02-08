#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"
#include "kernel/fs.h"
//#include <string.h>

int
main(int args, char *argv[])
{
//    char c=argv[2][0];
//    int ex=c-'0';
//    //float nes=c-'0';
    int ex=atoi(argv[2]);
    int bool=atoi(argv[3]);
    printf("Broj: %d \n ",ex);
    //printf("Broj: %d \n ",s);
   // printf("FLOAT: %f \n ",nes);
    if(argv[1]){
        changeSchedulingAlgorithm(argv[1],ex,bool);
        exit(0);
    }
    else{
        printf("Not enough parameters \n");
        exit(-2);
    }

}


