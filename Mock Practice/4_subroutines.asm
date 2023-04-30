section .data
    msg db "Hello world",0Ah

section .text
global _start
_start:
    mov eax,msg
    call strLen
    
    mov eax,4
    mov ebx,1
    mov ecx,msg
    mov edx,eax

strLen:
    push ebx
    mov ebx,eax
            
nextchar:
    cmp byte[eax],0
    jz finished
    inc eax
    jmp nextchar

finished:
    sub eax,ebx
    pop ebx
    ret