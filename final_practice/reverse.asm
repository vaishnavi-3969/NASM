; reverse code
%macro display 2
    mov eax,4
    mov ebx,1
    mov ecx,%1
    mov edx,%2
    int 80h
%endmacro

%macro read 2
    mov eax,3
    mov ebx,0
    mov ecx,%1
    mov edx,%2
    int 80h
%endmacro

section .bss
    str1 resb 10
    rev resb 10
    lenstr resb 2

section .data
    msg1 db "Enter the string: ",10,0
    len1 equ $-msg1
    msg2 db "Enter the string length: ",10,0
    len2 equ $-msg2
    msg3 db "Enter string reverse: ",10,0
    len3 equ $-msg3

section .text
global _start
_start:
    display msg1, len1
    read str1,10
    jmp reverse
    display msg3, len3
    jmp exit
    
reverse:
    mov esi,str1
    mov edi,rev
    mov cl,al
    add esi,eax
    dec esi
    L1:
        mov al, byte[esi]
        mov byte[edi],al
        inc edi
        dec esi
        dec cl
        jnz L1
    display rev,10
    int 80h
    
exit:
    mov eax,1
    mov ebx,0
    int 80h