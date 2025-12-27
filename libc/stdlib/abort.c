#include <stdio.h>
#include <stdlib.h>

__attribute__((__noreturn__))
void abort(void) {
#if defined(__is_libk)
    // If we are in the kernel, we can just halt the CPU.
    __asm__ volatile("cli; hlt");
#else
    // In user space, we can print an error message and exit.
    printf("Abort called! Terminating the program.\n");
    // Normally we would call exit here, but since exit is not implemented,
    // we will just enter an infinite loop.
    while (1) {
        __asm__ volatile("hlt");
    }
#endif
    while (1) {
        __builtin_unreachable();
    }
}