; performing all the arithmetic operations

section .data
    msg_num1 db "Enter number 1: ",10,0
    len_num1 equ $-msg_num1
    msg_num2 db "Enter number 2: ", 10,0
    len_num2 equ $-msg_num2
    msg_menu db 10,"---------Menu---------",10,"1. Addition",10,"2. Subtraction",10,"3. Multiplication",10,"4.Division",10,"0. Exit",10,"Enter your choice",10,0
    len_menu equ $-msg_menu
    msg_result db "The result is: ", 0
    len_result equ $ - msg_result
    msg_exit db "Program exitted...",10,0
    len_exit equ $-msg_exit
    msg_add db "---------Addition---------",10,0
    len_add equ $-msg_add
    msg_sub db "---------Subtraction---------",10,0
    len_sub equ $-msg_sub
    msg_mul db "---------Multiplication---------",10,0
    len_mul equ $-msg_mul
    msg_div db "---------Division---------",10,0
    len_div equ $-msg_div
    
section .bss
    num1 resb 2
    num2 resb 2
    result resb 2
    choice resb 2
    
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
    
    ; take input of choice
    mov eax,3
    mov ebx,0
    mov ecx, choice
    mov edx, 2
    int 80h
    
    cmp byte[choice],'0'
    je _exit
    cmp byte[choice],'1'
    je _add
    cmp byte[choice],'2'
    je _subtract
    cmp byte[choice], '3'
    je _multiplication
    cmp byte[choice], '4'
    je _division
    
_add:
    ; displaying msg
    mov eax,4
    mov ebx,1
    mov ecx, msg_add
    mov edx, len_add
    int 80h
    
    ; displaying message to enter first number
    mov eax,4
    mov ebx,1
    mov ecx, msg_num1
    mov edx, len_num1
    int 80h
    
    ; inputing first no.
    mov eax,3
    mov ebx,0
    mov ecx, num1
    mov edx,2
    int 80h
    
    ; displaying msg to enter second no.
    mov eax,4
    mov ebx,1
    mov ecx, msg_num2
    mov edx, len_num2
    int 80h
    
    ; inputing second no.
    mov eax,3
    mov ebx,0
    mov ecx, num2
    mov edx,2
    int 80h
    
    mov eax, [num1]
    sub eax,'0'
    mov ebx,[num2]
    sub ebx,'0'
    add eax,ebx
    add eax,'0'
    mov [result],eax
    
    ; display message
    mov eax,4
    mov ebx,1
    mov ecx, msg_result
    mov edx, len_result
    int 80h
    
    ; display result
    mov eax,4
    mov ebx,1
    mov ecx, result
    mov edx, 2
    int 80h
    jmp _start

_subtract:
    ; display msg
    mov eax, 4
    mov ebx,1
    mov ecx, msg_sub
    mov edx, len_sub
    int 80h
    
     ; displaying message to enter first number
    mov eax,4
    mov ebx,1
    mov ecx, msg_num1
    mov edx, len_num1
    int 80h
    
    ; inputing first no.
    mov eax,3
    mov ebx,0
    mov ecx, num1
    mov edx,2
    int 80h
    
    ; displaying msg to enter second no.
    mov eax,4
    mov ebx,1
    mov ecx, msg_num2
    mov edx, len_num2
    int 80h
    
    ; inputing second no.
    mov eax,3
    mov ebx,0
    mov ecx, num2
    mov edx,2
    int 80h
    
    mov eax, [num1]
    sub eax,'0'
    mov ebx,[num2]
    sub ebx,'0'
    sub eax,ebx
    add eax,'0'
    mov [result],eax
    
    ; display message
    mov eax,4
    mov ebx,1
    mov ecx, msg_result
    mov edx, len_result
    int 80h
    
    ; display result
    mov eax,4
    mov ebx,1
    mov ecx, result
    mov edx, 2
    int 80h
    jmp _start

_multiplication:
    mov eax,4
    mov ebx,0
    mov ecx, msg_mul
    mov edx, len_mul
    int 80h
    
    ; msg for num 1
    mov eax,4
    mov ebx,1
    mov ecx,msg_num1
    mov edx, len_num1
    int 80h
    
    ; input no. 1
    mov eax,3
    mov ebx,0
    mov ecx, num1
    mov edx, 2
    int 80h
    
    ; msg for num2
    mov eax,4
    mov ebx,1
    mov ecx, msg_num2
    mov edx, len_num2
    int 80h
    
    ; input second no.
    mov eax,3
    mov ebx,0
    mov ecx,num2
    mov edx, 2
    int 80h
    
    ; perform multiplication
    mov al,[num1]
    sub al, '0'
    mov bl,[num2]
    sub bl, '0'
    mul bl
    add al, '0'
    mov [result],al
    
    
    ; msg to display result
    mov eax,4
    mov ebx,1
    mov ecx, msg_result
    mov edx, len_result
    int 80h
    
    ; display result
    mov eax, 4
    mov ebx,1
    mov ecx, result
    mov edx, 2
    int 80h
    
    call _start
    
_division:
    mov eax,4
    mov ebx,0
    mov ecx, msg_div
    mov edx, len_div
    int 80h
    
    ; msg for num 1
    mov eax,4
    mov ebx,1
    mov ecx, msg_num1
    mov edx, len_num1
    int 80h
    
    ; input no. 1
    mov eax,3
    mov ebx,0
    mov ecx, num1
    mov edx, 2
    int 80h
    
    ; msg for num2
    mov eax,4
    mov ebx,1
    mov ecx, msg_num2
    mov edx, len_num2
    int 80h
    
    ; input second no.
    mov eax,3
    mov ebx,0
    mov ecx,num2
    mov edx, 2
    int 80h
    
    ; perform division
    mov al,[num1]
    sub al,'0'
    mov bl,[num2]
    sub bl,'0'
    div bl
    add al,'0'
    mov [result], al
    
    ; display result
    mov eax, 4
    mov ebx,1
    mov ecx, result
    mov edx, 2
    int 80h
    
    call _start

_exit:  
    mov eax,4
    mov ebx,1
    mov ecx, msg_exit
    mov edx, len_exit
    int 80h
    
    mov eax,1
    mov ebx,0
    int 80h
    