section .init
    /* gcc will nicely put the contents of crtend.o .init section here */
    pop ebp
    ret
    
section .fini
    /* gcc will nicely put the contents of crtend.o .fini section here */
    pop ebp
    ret