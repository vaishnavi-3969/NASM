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

section .data
    msg1 db "Enter the string: ",10,0
    len1 equ $-msg1
    msg2 db "Reverse string: ",10,0
    len2 equ $-msg2
    
section .bss
    str1 resb 10
    rev resb 10

section .text
global _start
_start:
    display msg1, len1
    read str1,10
    jmp reverse
    
reverse:
    mov esi, str1 ; move the contents of string to esi
    mov cl,al   ; move the length of string to cl (counter)
    add esi, eax ; point to the end of string + 1
    dec esi; point to end of string
    mov edi, rev   ; point to the beginning of new string
    L1:
        mov al,byte[esi]   ; move the string character by character to al
        mov byte[edi],al    ; move the string character by character to edi in reveres manner
        inc edi ; increment the edi pointer
        dec esi ; decrement esi poionter
        dec cl ; decrement counter
        jnz L1  ; loop until the string doesn't terminate
        display rev,10  ; display the reverse string
        int 80h
        
    jmp _start
    