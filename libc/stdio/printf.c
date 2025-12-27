#include <limits.h>
#include <stdbool.h>
#include <stdarg.h>
#include <stdio.h>

static bool print(const char *data, size_t length) {
    for (size_t i = 0; i < length; i++) {
        if (putchar(data[i]) == EOF) {
            return false;
        }
    }
    return true;
}

int printf(const char* restrict format, ...) {
    va_list args;
    va_start(args, format);

    const char *p = format;
    int total_written = 0;

    while (*p) {
        if (*p == '%') {
            p++;
            if (*p == 's') {
                const char *str = va_arg(args, const char *);
                size_t len = strlen(str);
                if (!print(str, len)) {
                    va_end(args);
                    return -1;
                }
                total_written += len;
            } else if (*p == 'c') {
                char c = (char)va_arg(args, int);
                if (putchar(c) == EOF) {
                    va_end(args);
                    return -1;
                }
                total_written++;
            } else if (*p == '%') {
                if (putchar('%') == EOF) {
                    va_end(args);
                    return -1;
                }
                total_written++;
            } else {
                // Unsupported format specifier
                va_end(args);
                return -1;
            }
        } else {
            if (putchar(*p) == EOF) {
                va_end(args);
                return -1;
            }
            total_written++;
        }
        p++;
    }

    va_end(args);
    return total_written;
}