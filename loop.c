#include <stdio.h>

int main() {
  int c = 0;

  loop:
  printf("%d\n", c);
  c++;
  if (c <= 10) { goto loop; }

  return 0;
}
