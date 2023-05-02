%macro display 2
    mov eax,4
    mov ebx,1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

%macro read 2
    mov eax,3
    mov ebx,0
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

section .bss
    str1 resb 10
    quotient resb 1
    remainder resb 1
    
section .data
    msg1 db "Enter the string: ",10,0
    len1 equ $-msg1
    msg2 db "Length of the string: ",10,0
    len2 equ $-msg2
    
section .text
global _start
_start:
    display msg1,len1
    read str1,10
    jmp len

len:
    dec al
    mov bl,10
    div bl
    add al,30h
    add ah,30h
    mov [quotient],al
    mov [remainder],ah
    display msg2,len2
    display quotient,1
    display remainder, 1
    int 80h
    jmp exit
exit: 
    mov eax,4
    mov ebx,1
    int 80h
    