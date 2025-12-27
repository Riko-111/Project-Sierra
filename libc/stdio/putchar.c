#include <stdio.h>

#if defined(__is_libk)
#include <kernel/tty.h>
#endif

int putchar(int c) {
#if defined(__is_libk)
    char ic = (char)c;
    terminal_write(&ic, sizeof(ic));
#else
    // In user space, we would write to stdout. Here we just return EOF.
    (void)c; // Suppress unused variable warning
    return EOF;
#endif
    return c;
}