#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>

int main(int argc, char *argv[])
{
  if (argc < 2) {
    printf("Plz specify uid\n");
    exit(1);
  }
  int uid = atoi(argv[1]);
  setreuid(uid, uid);

  uid_t curuid = getuid();

  printf("UID: %d\n", curuid);
  return 0;
}
