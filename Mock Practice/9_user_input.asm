section .data
    msg1 db 'Please enter your name', 0h
    msg2 db 'Hello, ',0h

section .bss
    sinput: resb 255

section .text
global _start
_start:
    mov eax,msg1
    call sprint

    mov edx, 255 ; no. of bytes to read
    mov ecx,sinput; buffer
    mov ebx,0 ; read from stdin
    mov eax,3
    int 80h

    mov eax,msg2
    call sprint

    mov eax,sinput
    call sprint

    call quit

