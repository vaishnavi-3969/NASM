;lower to upper
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
    uppercase resb 10

section .data
    msg1 db "Enter the string: ",10,0
    len1 equ $-msg1
    msg2 db "Uppercase: ",10,0
    len2 equ $-msg2

section .text
global _start
_start:
  display msg1,len1
  read string,10
  jmp upper

upper:
    dec al
    mov esi, string
    mov edi,uppercase
    mov cl,al
    jmp _upper

_upper:
    mov al,byte[esi]
    cmp al,'a'
    jb _store
    cmp al,'z'
    ja _store
    sub al,' '
    
_store:
    mov byte[edi],al
    inc esi
    inc edi
    dec cl
    jnz _upper
    display msg2,len2
    display uppercase,10
    jmp exit
exit:
    mov eax,1
    mov ebx,0
    int 80h