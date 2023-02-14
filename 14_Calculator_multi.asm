%include '5_functions.asm'

section .text
global _start
_start:
    mov eax,30
    mov ebx,8
    mul eax,ebx
    call iprintLF
    call quit