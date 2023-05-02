SYS_EXIT equ 1
SYS_READ equ 3
SYS_WRITE equ 4
STDIN equ 0
STDOUT equ 1

%macro display 2
    mov eax,4
    mov ebx,1
    mov ecx,%1
    mov edx,%2
    int 80h
%endmacro

%macro accept 2
    mov eax,SYS_READ
    mov ebx,STDIN
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

section .data
    msg_string db "Enter a string: ",10,0
    len_string equ $-msg_string
    msg_substring db "Enter a substring: ",10,0
    len_substring equ $-msg_substring
    msg_is_substring db "Substring present"
    len_is_substring equ $-msg_is_substring
    msg_not_substring db "Substring not present"
    len_not_substring equ $-msg_not_substring

section .bss
    string resb 10
    substring resb 10
    string_length resb 2
    substring_length resb 2
    
section .text
global _start
_start:
    display msg_string,len_string
    accept string, 10
    dec al
    mov [string_length],al
    display msg_substring,len_substring
    accept substring,10
    dec al
    mov [substring_length],al
    cmp al,[string_length]
    jg not_substring
    mov esi,string
    mov edi,substring
    mov cl,byte[string_length]
loop:
    mov ch,byte[esi]
    cmp ch,byte[edi]
    je next
    inc esi
    dec cl
    jz not_substring
    jnz loop
next:
    inc esi
    inc edi
    dec byte[substring_length]
    jz yes_substring
    mov ch,byte[esi]
    mov ch,byte[edi]
    je next
    jne loop2
    
loop2:
    inc esi
    dec edi
    jmp loop
    
not_substring:
    display msg_is_substring, len_is_substring
    mov eax,SYS_EXIT
    int 80h
    
yes_substring:
    display msg_not_substring, len_not_substring
    mov eax,SYS_EXIT
    int 80h
    