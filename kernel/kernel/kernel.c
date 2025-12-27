#include <stdio.h>
#include <kernel/tty.h>

int kernel_main(void) {
    terminal_initialize();
    printf("Hello, kernel World!\n");
}
