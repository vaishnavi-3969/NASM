%macro display 2
    mov eax,4
    mov ebx,1
    mov ecx, %1
    mov edx,%2
    int 80h
%endmacro
%macro read 2
    mov eax,3
    mov ebx,0
    mov ecx, %1
    mov edx,%2
    int 80h
%endmacro

section .bss
    str1 resb 100
    quotient resb 2

section .data
    msg_string db "Enter string: ",10,0
    len_msg_string equ $-msg_string
    msg_length db "The length of the string: ",10,0
    len_msg_length equ $-msg_length
    
section .text
global _start
_start:
    display msg_string, len_msg_string
    read str1,100
    jmp length
    
length:
    dec al
    mov bl,10
    div bl
    add al,30h
    add ah,30h
    mov [quotient+1],ah
    mov [quotient],al
    display msg_length, len_msg_length
    display quotient,2
    int 80h
    jmp exit

exit:
    mov eax,1
    mov ebx,0
    int 80h