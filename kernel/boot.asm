bits 32 ; 32 bity trybu chronionego

MBALIGN equ 1 << 0 ; wyrównanie do granicy strony
MEMINFO equ 1 << 1 ; pobierz informacje o pamięci
FLAGS equ MBALIGN | MEMINFO ; ustawienia trybu wielokrotnego ładowania
MAGIC equ 0x1BADB002 ; magiczna liczba wielokrotnego ładowania
CHECKSUM equ -(MAGIC + FLAGS) ; suma kontrolna

section .multiboot_header
align 4
    dd MAGIC          ; magiczna liczba
    dd FLAGS          ; ustawienia
    dd CHECKSUM      ; suma kontrolna

section .bss
align 16
stack_bottom:
    resb 16384       ; rezerwacja 16KB na stos
stack_top:

section .text
global _start:function (_start.end - _start) ; definicja globalna linkera
global _start

extern kernel_main

_start:
    mov esp, stack_top ; ustawienie wskaźnika stosu
    call kernel_main   ; wywołanie funkcji głównej jądra
    cli
.hang:
    hlt
    jmp .hang

.end:
