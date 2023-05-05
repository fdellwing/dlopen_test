#include <dlfcn.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char **argv) {
  void *handle1;
  void *handle2;
  void (*func_print_path)(const char *);

  handle1 = dlopen("./B/libfoo.so", RTLD_LAZY);
  if (!handle1) {
    fprintf(stderr, "Error: %s\n", dlerror());
    return EXIT_FAILURE;
  }

  handle2 = dlopen("./libbar.so", RTLD_LAZY);
  if (!handle2) {
    fprintf(stderr, "Error: %s\n", dlerror());
    return EXIT_FAILURE;
  }

  dlclose(handle1);
  dlclose(handle2);

  return EXIT_SUCCESS;
}
