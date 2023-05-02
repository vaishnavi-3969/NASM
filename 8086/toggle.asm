;Toggle : uppper to lower and lower to upper case
; =====================================================
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
    tog resb 10

section .data
    msg1 db "Enter the string: ",10,0
    len1 equ $-msg1
    msg2 db "Toggle: ",10,0
    len2 equ $-msg2

section .text
global _start
_start:
  display msg1,len1
  read string,10
  jmp toggle
  
toggle:
    dec al
    mov esi,string
    mov edi,tog
    mov cl,al
    jmp _toggle

_toggle:
    mov al,byte[esi]
    cmp al,'A'
    jb _store
    cmp al,'A'
    jae uppercase
    
lowercase:
    cmp al,'z'
    jbe _lowercase
    cmp al,'z'
    ja _store
    
_lowercase:
    cmp al,'a'
    jb _store
    sub al, ' '
    jmp _store
   
uppercase:
    cmp al,'A'
    jb _store
    cmp al,'A'
    jae _uppercase

_uppercase:
    cmp al,'Z'
    ja lowercase
    add al,' '
    jmp _store

_store:
    mov byte[edi],al
    inc edi,
    inc esi
    dec cl
    jnz _toggle
    display msg2,len2
    display tog,10
    jmp exit
         
exit:
    mov eax,1
    mov ebx,0
    int 80h
    