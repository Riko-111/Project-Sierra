section .data
align 4

gdt_start:
dq 0x0000000000000000 ; 8 bytes of zeros for first descriptor
; 2 - kernel code segment - properties;
; Base = 0
; Limit = 4GB
; Acces = 0x9A
; Flags 0xCF
gdt_code:
    dw 0xFFFF ; Limit (low 16 bits)
    dw 0x0000 ; Base (low 16 bits)
    db 0x00   ; Base (middle 8 bits)
    db 0x9A   ; Access byte
    db 0xCF   ; Flags and limit (high 4 bits)
    db 0x00   ; Base (high 8 bits)
; 3 - kernel data segment - properties;
; Base = 0
; Limit = 4GB
; Acces = 0x92
; Flags 0xCF
gdt_data:
    dw 0xFFFF ; Limit (low 16 bits)
    dw 0x0000 ; Base (low 16 bits)
    db 0x00   ; Base (middle 8 bits)
    db 0x92   ; Access byte
    db 0xCF   ; Flags and limit (high 4 bits)
    db 0x00   ; Base (high 8 bits)
gdt_end:

global gdt_descriptor
gdt_descriptor:
    dw gdt_end - gdt_start - 1 ; Limit (low 16 bits)
    dd gdt_start               ; Base (low 32 bits)

    
global gdt_flush
gdt_flush:
    mov eax, [esp + 4]
    lgdt [eax]
    
    mov eax, 0x10
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax
    jmp 0x8:flush_done

flush_done:
    ret
