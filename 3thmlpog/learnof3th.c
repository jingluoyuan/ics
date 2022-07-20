/* 3.4 
    unsignde char --> long
    movzbl  (%rdi),%eax
    movl    %eax,(%rsi)

为什么是movzbl不是movzbq,作者在课程网站的勘误表errata里说了，因为movzbl和movzbq的效果完全一样，
gcc编译器会生成movzbl。原因就是movzbl把8位零扩展成32位，同时触发x86-64的惯例
（任何为寄存器生成32位值的指令都会把高32位置零），
所以movzbl指令会继续把高32位置0，结果就是除了低8位放的是数值，其他56位都是0，和movzbq的效果完全一样。
*/
/*
leaq :load effective address quad
leaq S,D    D <-- &S
D must be a register

*/

