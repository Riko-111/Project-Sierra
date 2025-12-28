section .init
global _init:function
_init:
    push ebp
    mov ebp, esp
    /* gcc will nicely put the contents of crtbegin.o .init section here */

section .fini
global _fini:function
_fini:
    push ebp
    mov ebp, esp
    /* gcc will nicely put the contents of crtbegin.o .fini section here */