; performing all the arithmetic and logical operations
section .data
    msg_num1 db "Enter number 1: ",0
    len_num1 equ $-msg_num1
    msg_num2 db "Enter number 2: ",0
    len_num2 equ $-msg_num2
    msg_menu db 10,"!===============Menu===============!",10,"1. Addition",10,"2. Subtraction",10,"3. Multiplication",10,"4. Division",10,"5. AND",10,"6. OR",10,"7. NOT",10"0. Exit",10,"Enter your choice",10,0
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
    msg_div db "---------Division---------",1,0
    len_div equ $-msg_div
    msg_and db "---------AND---------",10,0
    len_and equ $-msg_and
    msg_or db "---------OR---------",10,0
    len_or equ $-msg_or
    msg_not db "---------NOT---------",10,0
    len_not equ $-msg_not
    msg_invalid db "INVALID CHOICE",10,0
    len_invalid equ $-msg_invalid
    
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
    cmp byte[choice],'5'
    je _and
    cmp byte[choice],'6'
    je _or
    cmp byte[choice],'7'
    je _not
    jne _invalid
    
_invalid:
    mov eax,4
    mov ebx,1
    mov ecx, msg_invalid
    mov edx, len_invalid
    int 80h
    jmp _start
    
_input:
    
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
    ret
    
_add:
; displaying msg
    mov eax,4
    mov ebx,1
    mov ecx, msg_add
    mov edx, len_add
    int 80h
    
    call _input
    mov eax, [num1]
    sub eax,'0'
    mov ebx,[num2]
    sub ebx,'0'
    add eax,ebx
    add eax,'0'
    mov [result],eax
    jmp _display

_subtract:
; displaying msg
    mov eax,4
    mov ebx,1
    mov ecx, msg_sub
    mov edx, len_sub
    int 80h
    call _input
    mov eax, [num1]
    sub eax,'0'
    mov ebx,[num2]
    sub ebx,'0'
    sub eax,ebx
    add eax,'0'
    mov [result],eax
    jmp _display

_multiplication:
; displaying msg
    mov eax,4
    mov ebx,1
    mov ecx, msg_mul
    mov edx, len_mul
    int 80h
   call _input
    ; perform multiplication
    mov al,[num1]
    sub al, '0'
    mov bl,[num2]
    sub bl, '0'
    mul bl
    add al, '0'
    mov [result],al
    jmp _display
    
_division:
; displaying msg
    mov eax,4
    mov ebx,1
    mov ecx, msg_div
    mov edx, len_div
    int 80h
    call _input
    ; perform division
    mov al,[num1]
    sub al,'0'
    mov bl,[num2]
    sub bl,'0'
    div bl
    add al,'0'
    mov [result], al
    jmp _display

_and:
; displaying msg
    mov eax,4
    mov ebx,1
    mov ecx, msg_and
    mov edx, len_and
    int 80h
    call _input
    ; performing operations
    mov eax,[num1]
    sub eax,'0'
    mov ebx,[num2]
    sub ebx,'0'
    and eax,ebx
    add eax,'0'
    mov [result],eax
    jmp _display
    
_or:
; displaying msg
    mov eax,4
    mov ebx,1
    mov ecx, msg_or
    mov edx, len_or
    int 80h
    call _input
    ; performing operations
    mov eax,[num1]
    sub eax,'0'
    mov ebx,[num2]
    sub ebx,'0'
    or eax,ebx
    add eax,'0'
    mov [result],eax
    jmp _display

_not:
    ; display message
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_not
    mov edx, len_not
    int 80h
    
    ; read input
    mov eax, 3
    mov ebx, 0
    mov ecx, num1
    mov edx, 2
    int 80h
    
    ; perform logical NOT
    mov eax, [num1]
    not eax
    mov [result], eax
    
    ; display result
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_result
    mov edx, len_result
    int 80h
    
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 2
    int 80h
    jmp _start

_display:
    ; displaying msg of result
    mov eax,4
    mov ebx,1
    mov ecx,msg_result
    mov edx, len_result
    int 80h
    
    ; displyaing result
    mov eax,4
    mov ebx,1
    mov ecx,result
    mov edx, 2
    int 80h
    jmp _start

_exit:  
    mov eax,4
    mov ebx,1
    mov ecx, msg_exit
    mov edx, len_exit
    int 80h
    
    mov eax,1
    mov ebx,0
    int 80h
    