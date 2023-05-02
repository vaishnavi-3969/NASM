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

section .bss
    str1 resb 50
    str2 resb 50
    lenstr resb 2

section .data
    msg_string db "Enter the string: ",10,0
    len_string equ $-msg_string
    msg_concatenation db "Concatenated string: ",10,0
    len_concatenation equ $-msg_concatenation
    
section .text
global _start
_start:
    display msg_string,len_string
    read str1,50
    jmp concat1
    
concat1:
    dec al
    mov esi,str1
    mov edi,str2
    mov cl,al
    L1:
        mov al,byte[esi]
        mov byte[edi],al
        inc esi
        inc edi
        dec cl
        jnz L1
    jmp concat2

concat2:
    display msg_string,len_string
    read str1,50
    dec al
    mov esi,str1
    mov cl,al
   L2:
        mov al,byte[esi]
        mov byte[edi],al
        inc esi
        inc edi
        dec cl
        jnz L2
    display msg_concatenation,len_concatenation
    display str2,50
    jmp exit
    
exit:
    mov eax,1
    mov ebx,0
    int 80h