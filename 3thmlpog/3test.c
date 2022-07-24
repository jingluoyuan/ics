void decode1(long *xp ,long *yp,long *zp){
	long x=*xp;
	long y=*yp;
	long z=*zp;
	*yp=x;
	*zp=y;
	*xp=z;
}
long scale (long x,long y ,long z){
	long t=x+4*y+12*z;
	return t;
}
int main(){
	printf("0x%x",sizeof(long));
	return 0;
}

	
