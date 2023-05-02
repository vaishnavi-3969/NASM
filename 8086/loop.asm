section .bss
    num resb 1

section .text
global _start
_start:
    mov ecx, 10
    mov eax,'1'
    
L1:
    mov [num],eax
    mov eax,4
    mov ebx,1
    push ecx
    
    mov ecx, num
    mov edx,1
    int 80h
    
    mov eax,[num]
    sub eax,'0'
    inc eax
    add eax,'0'
    pop ecx
    loop L1
    
    mov eax,1
    mov ebx,0
    int 80h
    