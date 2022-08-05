/*
#include<stdio.h>
typedef unsigned char *byte_pointer;
void show_bytes(byte_pointer start,size_t len){
    size_t i;
    for(i=0;i<len,i++){
        printf(" %.2x",start[i]);
    printf("\n");
    }
}

*/

 #include<stdio.h>
 void show_short(short *);
 void show_bytes(unsigned char *,size_t);
void show_long(long *p);
 int main(){
    int i=-6565;
    char c=234;
    long l=0x1234;
    short s=12;
    show_long(&l);
    if (is_little_endian()==1)
        printf("This machine is little endian");
    else
        printf("This machine is not little endian");
    printf("\n");
    unsigned char *p=(unsigned char *)&l;
    printf("%x",p[0]);
 }
 void show_bytes(unsigned  char *p,size_t c){
     for(unsigned i=0;i<c;i++){
         printf("%.2x ",p[i]);
     }
     printf("\n");
}
void show_short(short *p){
    show_bytes((unsigned char *)p,sizeof(short));
}
void show_long(long *p){
    show_bytes((unsigned char *)p,sizeof(long));
}
int is_little_endian(){
    short s=0xf000;
    unsigned char  *p=(unsigned char *)&s;
    if(p[0]==0x0)
        return 1;
    else
        return 0;
}
//%x:unsigned int 
 // %p void*
