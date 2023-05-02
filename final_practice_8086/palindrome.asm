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
    string resb 10
    rev resb 10
    lenstr resb 2
    
section .data
    msg_string db "Enter string: ",10,0
    len_string equ $-msg_string
    msg_pall db "PALLINDROME",10,0
    len_pall equ $-msg_pall
    msg_not db "NOT PALLINDROME",10,0
    len_not equ $-msg_not
    
section .text
global _start
_start:
    display msg_string, len_string
    read string,10
    jmp reverse

reverse:
    dec al
    mov esi,string
    mov byte[lenstr],al
    add esi,eax
    mov cl,byte[lenstr]
    dec esi
    mov edi,rev
    L1:
        mov al,byte[esi]
        mov byte[edi],al
        inc edi
        dec esi
        dec cl
        jnz L1
    mov esi,string
    mov edi,rev
    jmp pallindrome
    
pallindrome:
    mov al,byte[esi]
    cmp al,byte[edi]
    jne Npall
    inc esi
    inc edi
    dec cl
    jmp Ypall

Ypall:
    display msg_pall, len_pall
    jmp _start

Npall:
    display msg_not, len_not
    jmp _start
    
exit:
    mov eax,1
    mov ebx,0
    int 80h