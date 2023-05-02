section .data
    msg db "The sum is : ",10,0
    len equ $-msg
    num1 db '12345'
    num2 db '23456'
    sum db '     '
    
section .text
global _start
_start:
    mov esi,4 ; poinintg to rightmost digit = 0 based indexing
    mov ecx, 5 ; no. of digits
    clc ; clearn carry flag
    
add_loop:   
    mov al,[num1 + esi] ; points to rightmost digit initially
    adc al,[num2 + esi] ; ""
    aaa ; adjust after addition
    pushf ;
    or al,30h ; convert to ascii value
    popf
    mov [sum + esi],al
    dec esi
    loop add_loop
    
    mov eax,4
    mov ebx,1
    mov ecx, msg
    mov edx, len
    
    mov eax,4
    mov ebx,1
    mov ecx, sum
    mov edx, 5
    int 80h
    
    mov eax,1
    mov ebx,0
    int 80h
    
    