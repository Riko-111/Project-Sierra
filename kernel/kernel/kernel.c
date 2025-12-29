#include <stdio.h>
#include <stdint.h>
#include <kernel/tty.h>

extern void gdt_flush(uint32_t);
extern void* gdt_descriptor;

int main() {
    terminal_initialize();
    printf("Initializing GDT...\n");
    gdt_flush((uint32_t)&gdt_descriptor);
    printf("GDT Loaded successfully!\n");
    printf("Hello, kernel World!\n");
}
