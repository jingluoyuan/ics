long swap_add(long *a,long *b){
	long x= *a;
	long y= *b;
	*a=y;
	*b=x;
	return x+y;
}
long caller(){
	long arg1=534;
	long arg2=1057;
	long sum=swap_add(&arg1,&arg2);
	long diff=arg1-arg2;
	return sum*diff;
}
