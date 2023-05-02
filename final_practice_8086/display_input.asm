section .data
    userMsg db "Enter a no.: ",10,0
    lenUserMsg equ $-userMsg
    displayMsg db "You entered: ",10,0
    lenDisplayMsg equ $-displayMsg
    
section .bss
    num resb 5

section .data
global _start
_start:
    mov eax,4
    mov ebx,1
    mov ecx, userMsg
    mov edx, lenUserMsg
    int 80h
    
    mov eax,3
    mov ebx,0
    mov ecx, num
    mov edx, 5
    int 80h
    
    mov eax,4
    mov ebx,1
    mov ecx, displayMsg
    mov edx, lenDisplayMsg
    int 80h
    
    mov eax,4
    mov ecx,1
    mov ecx, num
    mov edx, 5
    int 80h
    
    mov eax,1
    mov ebx,0
    int 80h