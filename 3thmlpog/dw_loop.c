long dw_doop(long x){
	long y=x*x;
	long *p=&x;
	long n=x*2;
	do{
		x+=y;
		(*p)++;
		n--;
	}while(n>0);
	return x;
}

