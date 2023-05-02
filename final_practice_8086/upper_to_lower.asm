;upper to lowercase 
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
    lowercase resb 10

section .data
    msg1 db "Enter the string: ",10,0
    len1 equ $-msg1
    msg2 db "Lowercase: ",10,0
    len2 equ $-msg2

section .text
global _start
_start:
  display msg1,len1
  read string,10
  jmp lower
  
lower:
    dec al
    mov esi,string
    mov edi,lowercase
    mov cl,al
    jmp _lower

_lower:
    mov al,byte[esi]
    cmp al,'A'
    jb _store
    cmp al,'Z'
    ja _store
    add al,' '
    jmp _store
    
_store:
    mov byte[edi],al
    inc esi
    inc edi
    dec cl
    jnz _lower
    display msg2,len2
    display lowercase,10
    jmp exit

exit:
    mov eax,1
    mov ebx,0
    int 80h