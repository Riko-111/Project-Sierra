#include <stdio.h>
#include <kernel/tty.h>

int main() {
    terminal_initialize();
    printf("Hello, kernel World!\n");
}