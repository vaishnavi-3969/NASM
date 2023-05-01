; Develop an application using x86 ALP to accept a signed number and check if it is positive or negative.

section .data
    msg_enterno db "Enter the no.: ",10,0
    len_enterno equ $-msg_enterno
    msg_positive db "The no. is +ve",10,0
    len_positive equ $-msg_positive
    msg_negative db "The no. is -ve",10,0
    len_negative equ $-msg_negative
    msg_zero db"The no. is zero",10,0
    len_zero equ $-msg_zero
    msg_invalid db "Invalid no.",10,0
    len_invalid equ $-msg_invalid
    
section .bss
    num resb 10

section .text
global _start
_start:
    ; display message
    mov eax,4
    mov ebx,1
    mov ecx,msg_enterno
    mov edx, len_enterno
    int 80h
    
    ; take input
    mov eax,3
    mov ebx,0
    mov ecx, num
    mov edx,10
    int 80h
    
    mov eax,[num]
    ; performing checks
    cmp al,'+'
    je pos
    cmp al,'-'
    je negi
    cmp al,'0'
    je zero
    cmp al,'9'
    jae invalid
    
pos:
    mov eax,4
    mov ebx,1
    mov ecx, msg_positive
    mov edx, len_positive
    int 80h
    jmp _start
negi:
    mov eax, 4
    mov ebx,1
    mov ecx, msg_negative
    mov edx, len_negative
    int 80h
    jmp _start
zero:
    mov eax,4
    mov ebx,1
    mov ecx,msg_zero
    mov edx,len_zero
    int 80h
    jmp _start
    
invalid:
    mov eax,4
    mov ebx,1
    mov ecx, msg_invalid
    mov edx,len_invalid
    jmp _start