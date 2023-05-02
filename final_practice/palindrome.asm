; pallindrome
; =======================================

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
    msg db "Enter the string: ",10,0
    len equ $-msg
    msg_pall db "Pallindrome",10,0
    len_pall equ $-msg_pall
    msg_not db "Not pallindrome",10,0
    len_not equ $-msg_not
    
section .text
global _start
_start:
    display msg,len
    read string,10
    jmp reverse
reverse:
    dec al
    mov esi,string
    mov cl,al
    mov edi,rev
    mov [lenstr],al
    add esi,eax
    dec esi
    L1:
        mov al,byte[esi]
        mov byte[edi],al
        inc edi
        dec esi
        dec cl
        jnz L1
    jmp pall

pall:
    mov esi,string
    mov edi,rev
    mov cl,byte[lenstr]
    
up2:
    mov al,byte[esi]
    cmp al,byte[edi]
    jne Npall
    inc esi
    inc edi
    dec cl
    jnz up2
    jmp Ypall
    
Ypall:
    display msg_pall,len_pall
    jmp _start
Npall:
    display msg_not,len_not
    jmp _start
exit:
    mov eax,1
    mov ebx,0
    int 80h
    