/*
 * rotate-left.c
 */
#include <stdio.h>
#include <assert.h>

/*
 * Do rotate left shift. Assume 0 <= n < w
 * Example when x = 0x12345678 and w = 32:
 *   n = 4 -> 0x23456781, n = 20 -> 0x67812345
 */
unsigned rotate_left(unsigned x, int n) {
  int w = sizeof(unsigned) << 3;
  /* pay attention when n == 0 */
  return x << n | x >> (w - n - 1) >> 1;
}

int main(int argc, char* argv[]) {

  printf("%d",sizeof(5));
  return 0;
}
int saturating_add(int x,int y){

}

