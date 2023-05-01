; performing all the arithmetic operations
section .data
    msg_num1 db "Enter number 1: ",10,0
    len_num1 equ $-msg_num1
    msg_num2 db "Enter number 2: ", 10,0
    len_num2 equ $-msg_num2
    msg_sum db "1. Addition",10,0
    len_sum equ $-msg_sum
    msg_diff db "2. Subtraction",10,0
    len_diff equ $-msg_diff
    msg_exit db "0. Exit", 10,0
    len_exit equ $-msg_exit
    msg_menu db "-------------Menu-------------",10,0
    len_menu equ $-msg_menu
    msg_mul db "3. Multiplication",10,0
    len_mul equ $-msg_mul
    msg_div db "4. Division",10,0
    len_div equ $-msg_div
    msg_choice db "Enter your choice: ",10,0
    len
    
section .bss
    num1 resb 2
    num2 resb 2
    addition resb 2
    subtraction resb 2
    multiply resb 2
    division resb 2
    
section .text
    global _start
    
_start:
    call _menu
    
_menu:
    ; menu
    ; display menu option
    mov eax,4
    mov ebx,1
    mov ecx, msg_menu
    mov edx, len_menu
    int 80h
    
    ; display sum option
    mov eax,4
    mov ebx,1
    mov ecx, msg_sum
    mov edx, len_sum
    int 80h
    
    ; display diff option
    mov eax,4
    mov ebx,1
    mov ecx, msg_diff
    mov edx, len_diff
    int 80h
    
    ; display multiplication option
    mov eax,4
    mov ebx,1
    mov ecx, msg_mul
    mov edx, len_mul
    int 80h
    
    ; display division option
    mov eax,4
    mov ebx,1
    mov ecx, msg_div
    mov edx, len_div
    int 80h
    
    ; display exit option
    mov eax,4
    mov ebx,1
    mov ecx, msg_exit
    mov edx, len_exit
    int 80h
    ; display to enter the user's choice
    
_exit:  
    mov eax,1
    mov ebx,0
    int 80h
    