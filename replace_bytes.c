#include<stdio.h>
unsigned replace_bytes(unsigned x,int i,unsigned char b);
int main(){
    unsigned x=0x12345678;
    int i=2;
    unsigned char b=0xAB;
    unsigned  e=replace_bytes(x,i,b);
    printf("%x",e);
}
unsigned replace_bytes(unsigned x,int i,unsigned char b){
    int n=0xff;
    i=i<<3;
    return ((x & ~(n<<i)) | b<<i );
}