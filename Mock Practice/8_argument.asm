% include '5_functions.asm'

section .text
    global _start

_start:
    pop ecx

nextArgs:
    cmp ecx,0h
    jz noMoreArgs
    pop eax
    call sprintLF
    dec ecx
    jmp nextArgs

noMoreArgs:
    call quit