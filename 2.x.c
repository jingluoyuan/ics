#include<stdio.h>
#include<stdlib.h>
#include <inttypes.h>
#include <string.h>
#include<assert.h>
#include<math.h>
typedef unsigned float_bits;
unsigned sr1(unsigned,int);
int sra(int,int);
unsigned rotate_left(unsigned,int);
unsigned unsigned_high_prod(unsigned,unsigned);
unsigned another_unsigned_high_prod(unsigned,unsigned);
unsigned f2u(float);
int float_le(float ,float);
float fpwr2(int);
float_bits float_negate(float_bits);
float u2f(unsigned);
int main(){
    long double x=2.6;
    printf("%u\n",sizeof(long double));
    printf("%d\n",any_bit1(0xfffffff0));
    printf("%d\n",any_bit0(0x0000000f));
    printf("%d\n",lowst_byte1(0xffff00ff));
    printf("%d\n",highst_byte1(0xffd00000));
    printf("%d\n",int_shifts_are_arithmetic());
    printf("%x\n",sr1(0xffff0000,3));
    printf("%x\n",sra(0xff110022,3));
    printf("%d\n",any_odd_one(0xaaaaaa5a));
    printf("0x%x\n",leftmost_one(0x0000));
    printf("%d\n",int_size_is_32());
    printf("0x%x\n",lower_one_mask(6));
    printf("0x%x\n",rotate_left(0x12345678,0));
    printf("%d\n",fits_bits(0xfffff0f0,16));
    printf("0x%x\n",xbyte(0x12345678,0));
    printf("%d\n",saturating_add(1234567890,2123456789));
    printf("%d\n",sub_ok(0x80000000,555));
    printf("0x%x\n",unsigned_high_prod(0x12345678,0xffffffff));
    printf("%u\n",another_unsigned_high_prod(0x12345678,0xffffffff));
    printf("%d\n",divide_power2(0x345,2));
    printf("%d\n",mul3div4(36)==36*3/4);
    printf("%d\n",k2(28,4));
    printf("%d\n",float_le(+0,-0.5));
    printf("%f \t %f\n",fpwr2(128),powf(2,128));
    assert(fpwr2(126)==powf(2,126));
//    for(unsigned i=0;i<0xffffffff;i++){
//     assert(u2f(float_negate(i))==-u2f(i));
//    }

}

int any_bit1(int x){
    return !~x;
}
int any_bit0(int x){
    return !x;
}
int lowst_byte1(int x){
   return !(x & 0xff ^ 0xff);
}
int highst_byte1(int x ){
    return !(x>>((sizeof(int)-1)<<3) & 0xff ^ 0xff);
}
int int_shifts_are_arithmetic(){
    return !(~(~0 >>((sizeof(int)-1)<<3)));
}
unsigned sr1(unsigned x,int k){
    unsigned xsra=(int)x >> k;
    int w=sizeof(int)<<3;
    int mask=~(~0 << (w-k) & ~((k!=0)-1));
    return (x & mask);
}
int sra(int x,int k){
    int xsr1 =(unsigned)x >>k;
    int w=sizeof(int)<<3;
    int sign=(int)((((unsigned)x >>(w-1))!=1)-1);
    //int sign=(unsigned)x >>(w-1);
    int mask=(~0<<(w-k) & ~((k!=0)-1)) & sign;
    //int mask=(~(sign-1)<<(w-k)) &  ~((k!=0)-1)
    return ( xsr1 | mask );
}
int any_odd_one(unsigned x){
    return ((0x55555555 & x)!=0);
}
int odd_ones(unsigned x){
    x^=x>>16;
    x^=x>>8;
    x^=x>>4;
    x^=x>>2;
    x^=x>>1;
    return (x & 0x1);
}
int leftmost_one(unsigned x){
    x=x | x>>16;
    x=x | x>>8;
    x=x | x>>4;
    x=x | x>>2;
    x=x | x>>1;
    return (x+0x1)>>1;
}  
int int_size_is_32(){
    int set_msb=1<<15<<15<<1; //int set_msb=1 << 31;
    int beyond_msb=set_msb<<1;
    return set_msb && !beyond_msb;
}
int lower_one_mask(int n){
    return (1<<(n-1)<<1)-1;
}
unsigned rotate_left(unsigned x,int n){
    int w=sizeof(x)*8;
    printf("%d\n",w);
    return ((x>>(w-n)) |  (x<<n));
}
int fits_bits(int x ,int n){
    int w=sizeof(int)*8;
    int offset=w-n;
    return (x<<offset>>offset)==x;
}
int xbyte(unsigned word,int bytenum){
    return (int)((word >>(bytenum<<3))&0xff);
    /*
    int_size=sizeof(int);
    return (int)word<<(int_size-bytenum)>>int_size;
    */
}
int saturating_add(int x,int y){
    int sum=x+y;
    int sign_mask=INT_MIN;
    int pos_over=!(sign_mask & x) && !(sign_mask & y) && (sign_mask & sum);
    int neg_over=(sign_mask & x) && (sign_mask & y) && !(sign_mask & sum);
    (pos_over && (sum=INT_MAX) || neg_over && (sum=INT_MIN));
    return sum;
}
int sub_ok(int x,int y){
    int sign_mask=INT_MIN;
    int sub=x-y;
    int if_pos=(x & sign_mask) || !(y & sign_mask) || !(sub & sign_mask);
    int if_neg=!(x & sign_mask) || (y & sign_mask) || (sub & sign_mask);
    return (if_pos && if_neg);
}
int signed_high_prod(int m,int n){
        int64_t mul=(int64_t) m*n;
        return mul>>32;
}

unsigned unsigned_high_prod(unsigned x,unsigned y){
    int signed_x=x>>31;
    int signed_y=y>>31;
    int signed_prod=signed_high_prod(x,y);
    return signed_prod+signed_x*y+signed_y*x;
}
unsigned another_unsigned_high_prod(unsigned x,unsigned y){
    uint64_t mul=(uint64_t)x*y;
    return !(mul>>32 ^ unsigned_high_prod(x,y));
}
void *another_calloc(size_t nmemb,size_t size){
    if(nmemb==0 || size==0){
        return NULL;
    }
    size_t buf_size=nmemb*size;
    void *ptr;
    if(buf_size/nmemb==size){
        ptr=(void*)malloc(buf_size);
        if(ptr!=NULL){
            memset(ptr,0,buf_size);
        }
        return ptr;
    }
    return NULL;
}
void mul_K(int x){
    //K=17
    (x<<4)+x;
    //K=-7;
    -((x<<2)+(x<<1)+x);
}
int divide_power2(int x,int k){
    int is_neg=x & INT_MIN;
    is_neg && (x+=(1<<k)-1);
    return x>>k;
}
int mul3div4(int x){
    return divide_power2(((x<<1)+x),2);
}
// int threefourths(int x){
// 
// }
int k1(int k){
    return (-1)<<k;
}
int k2(int k,int j){
    return (~k1(k))<<j;
}
//A False   y=Tmin
//B True    7+3=-6 then -6-3=7 so 7+3-3=7                     
//C True    ~x+~y+1=~x+1+~y+1-1=-x+-y-1=-(x+y)-1=~(x+y)
//D True    
//E True 

/*
A.
    n=0.yyyyyyy
    n<<k=y.yyyyyy...=Y+n
    n<<k-n=Y
    n=Y/(2^k-1)
B.
    (a)101
        n=101/(2^3-1)=5/7
    (b)0110
        n=6/15=2/5
    (c)010011
        n=19/63=19/63
*/

unsigned f2u(float x){
    return *(unsigned *) &x;
}
int float_le(float x,float y){
    unsigned ux=f2u(x);
    unsigned uy=f2u(y);
    unsigned sx=ux>>31;
    unsigned sy=uy>>31;
    return ((ux<<1==0 && uy<<1==0)||  
            (!sx && !sy && ux<=uy)||
            (!sx && sy)||
            (sx && sy && ux>=uy)
        );
}


/*
    V=1.f*2^E=M*^E
    bias=2^(k-1)-1
    A. 
        7.0=111.000
        M=1.11,f=0.11,E=2,V=7.0,k=2
        bits=010...01110...
    B.
        bits=0 bias+n 1111...
    C.
        smallest starnder=0 1-bias 00...
        reciprocal of it=0 bias-1 00...=011...101000...
*/
/*
                                                bits                 decimal
    minimal positive denormalization :    000000...10000..1         2^(1-bias-n)
    minimal positive normalization   :    000000...01100..0         2^(1-bias)
    maximum positive normalization   :    011111...10111..1         2^bias*(2-2^-n)     //2^(n+bias)x   
*/
/*
/*
    describle                       Hex         M       E       V
    -0 => 1000000000000000          0x8000      0       -14     -0
    smalarger2 =>0100000000000001   0x4001    1+2^-10    1      2+2^-9 
    256 => 0100011100000000         0x4700      1       8       +256 
    larstdenm =>0000000011111111    0x00ff      0.11... -14     2^(-62)*(1-2^(-8))
    -∞  => 1111111100000000         0xff00                 
    0x3AA0 => 0100011001010100      0x4654     1.01010100 7      15008
*/
float u2f(unsigned x){
    return *(float *)&x;
}             
float fpwr2(int x){
    unsigned exp,frac;
    unsigned u;
    if(x<-149){
        exp=0;
        frac=0;
    }
    else if(x<-126){
        exp=0;
        frac=1<<(149+x);
    }
    else if(x<128){
        exp=x+127;
        frac=0;
    }
    else{
        exp=0xff;
        frac=0;
    }
    u=exp<<23 | frac;
    return u2f(u);
}
/*
    A.  0x40490fdb=0b 0 10000000 10010010000111111011011    =>  11.001001000011
    B.                                                      =>  11.001001001001
*/
float_bits float_negate(float_bits f){
    unsigned sign=f>>31;
    unsigned exp=(f>>23) & 0xff;
    unsigned frac=f & 0x7fffff;
    if(exp==0xff && frac!=0)
        return f;
    else {
        float_bits u=((!sign)<<31) | (exp<<23) |  frac;
        return  u;
    }
        
}
float_bits float_twice(float_bits f){
        unsigned exp,frac;
        unsigned u;
        unsigned sign;
        sign=f>>31;
        exp=f>>23 & 0xff;
        frac=f & 0x7fffff;
        if(exp=0xff && !frac ){
            return f;
        }
        else if(exp==0){
            if(!(frac>>22))
                frac<<=1;
            else
                exp+=1;
        }
        else{
            exp++;
            if(exp==25)
                frac=0;
        }   
        return (sign << 31) | (exp <<23 ) | frac;
}
float_bits float_half(float_bits f){
        unsigned exp,frac;
        unsigned u;
        unsigned sign;
        sign=f>>31;
        exp=f>>23 & 0xff;
        frac=f & 0x7fffff;
        unsigned addition=(frac & 0x3)==0x3;
        if(exp==255){
            return f;
        }
        else if(exp==0){
            frac>>1;
            frac+=addition;
        }
        else if(exp==1){
            exp--;
            frac>>=1;
            frac+=addition;
            frac |=0x400000;
        }
        else{
            exp--;
        }
        return (sign<<31) | (exp << 23) | frac;  
}
int float_f2i(float_bits f){
    unsigned exp,frac;
    unsigned M;
    unsigned sign;
    unsigned E;
    int num;
    sign=f>>31;
    exp=f>>23 & 0xff;
    frac=f & 0x7fffff;
    if(exp>=0 && exp<127)
        return 0;
    else if(exp>157) 
        return 0x80000000;
    else{
        E=exp-127;
        M=frac | 0x800000;
        if(E>23){
            num=M<<(E-23);
        }
        else{
            num=M>>(23-E);
        }
    }  
    return sign?-num:num;
}
float_bits float_i2f(int i){
    unsigned exp,frac;
    unsigned u;
    if(i==0){
        exp=0;
        frac=0;
    }
    else if(i<5){
        i=1;
    }
}