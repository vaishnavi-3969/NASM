; concatenation of the string
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
    mov edx,%2
    int 80h
%endmacro

section .bss
    str1 resb 50
    str2 resb 50
    lenstr resb 2
    
section .data
    msg1 db 10,"Enter the string: ",10,0
    len1 equ $-msg1
    msg2 db "String after concatenation: ",10,0
    len2 equ $-msg2
    
section .text
    global _start
_start:
    display msg1,len1
    read str1,10
    jmp concstr1
concstr1:
    dec al
    mov byte[lenstr],al
    mov esi,str1
    mov edi,str2
    mov cl,byte[lenstr]
    L1:
        mov al,byte[esi]
        mov byte[edi],al
        inc edi
        inc esi
        dec cl
        jnz L1
    jmp concstr2
        
concstr2:
    display msg1,len1
    read str1,10
    dec al
    mov byte[lenstr],al
    mov esi,str1
    mov cl,byte[lenstr]
    L2:
        mov al,byte[esi]
        mov byte[edi],al
        inc edi
        inc esi
        dec cl
        jnz L2
    display msg2,len2
    display str2,10
    jmp _start
        