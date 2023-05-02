%macro display 2
    mov eax,4
    mov ebx,1
    mov ecx, %1
    mov edx,%2
    int 80h
%endmacro
%macro read 2
    mov eax,3
    mov ebx,0
    mov ecx, %1
    mov edx,%2
    int 80h
%endmacro

section .bss
    str1 resb 100
    rev resb 100

section .data
    msg_string db "Enter string: ",10,0
    len_string equ $-msg_string
    msg_reverse db "Reverse: ",10,0
    len_reverse equ $-msg_reverse
    
section .text
global _start
_start:
    display msg_string, len_string
    read str1,100
    jmp reverse
    
reverse:
    mov esi,str1
    mov cl,al
    add esi,eax
    dec esi
    mov edi,rev
    L1:
        mov al,byte[esi]
        mov byte[edi],al
        inc edi
        dec esi
        dec cl
        jnz L1
    display msg_reverse,len_reverse
    display rev,100
    int 80h
    jmp exit
    

exit:
    mov eax,1
    mov ebx,0
    int 80h