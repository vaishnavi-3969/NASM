%include '16_functions.asm'

section .text
global _start
_start:
    pop ecx ; 1st value -> no. of args
    pop edx; 2nd value -> program name(discarded when we initialized edx)
    sub ecx,1 ; no. of args w/o program name
    mov edx,0; initialize data reg to store additions

nextArgs:
    cmp ecx,0h; checkign if any args left
    jz noMoreArgs
    pop eax
    call atoi ; convert ascii to decimal int
    add edx,eax ; add logic
    dec ecx; no. of args left
    jmp nextArgs

noMoreArgs:
    mov eax,edx ; for printing
    call iprintLF
    call quit