#include<stdio.h>
#include<stdlib.h>
int main(int argc,char *argv[]){
	for (int i=1;i<argc;i++){
		int c=atoi(argv[i]);
		printf("%c",c);
	}
	return 0;

}
