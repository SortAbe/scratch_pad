#include <stdio.h>
#include <sys/time.h>

long getMicrotime() {
  struct timeval currentTime;
  gettimeofday(&currentTime, NULL);
  return currentTime.tv_sec * (int)1e6 + currentTime.tv_usec;
}

int main() {
  long start = getMicrotime();
  int b = 0;
  int c = 0;
  for (int i = 0; i < 30000000; i++) {
    b = c + i;
  }
  printf("Mili: %ld\n", (getMicrotime() - start)/1000);
  return 0;
}
