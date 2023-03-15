; program to check if the 2 digit signed no. is positive or negative

section .data
    msg_display db "Enter a 2-digit no.: ", 10, 0
    len_display equ $-msg_display
    msg_positive db "The no. is +ve", 10, 0
    len_positive equ $-msg_positive
    msg_negative db "The no. is -ve", 10, 0
    len_negative equ $-msg_negative
    msg_zero db "The no. is zero", 10,0
    len_zero equ $-msg_zero
    msg_invalid db "The no. is invalid", 10, 0
    len_invalid equ $-msg_invalid
    
section .bss
    num resb 2

section .data
global _start
_start:
    ; text to display
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_display
    mov edx, len_display
    int 80h
    
    ; take the input no. 
    mov eax, 3
    mov ebx, 0
    mov ecx, num
    mov edx, 2
    int 80h
    
    ; move the number to accumulator
    mov eax, [num]
    ; comparing lower nibble
    cmp al, '+'
    je check_positive
    cmp al, '-'
    je check_negative
    cmp al, '0'
    je check_zero
    cmp al,'9'
    je invalid
    
check_positive:
    cmp ah, '0'
    jb invalid
    cmp ah, '9'
    ja invalid
    jmp positive
    
check_negative:
    cmp ah,'0'
    jb invalid
    cmp al,'9'
    ja invalid
    jmp negative
    
check_zero:
    cmp ah,'0'
    je zero
    cmp ah,0h
    je zero
    jmp invalid
    
positive:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_positive
    mov edx, len_positive
    int 80h
    jmp exit
    
negative:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_negative
    mov edx, len_negative
    int 80h
    jmp exit
    
zero:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_zero
    mov edx, len_zero
    int 80h
    jmp exit
    
invalid:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_invalid
    mov edx, len_invalid
    int 80h
    jmp exit
    
exit:
    mov eax,1
    mov ebx,0
    int 80h
    