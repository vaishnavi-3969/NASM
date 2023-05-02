SYS_EXIT equ 1
SYS_WRITE equ 4
STDIN equ 0
STDOUT equ 1

section .data
    msg1 db "Hello",10,0
    len1 equ $-msg1
    msg2 db "world",10,0
    len2 equ $-msg2
    msg3 db "Assembly language programming",10,0
    len3 equ $-msg3
    
section .text
global _start
_start:
    mov eax,SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg1
    mov edx, len1
    int 80h
    
    mov eax,SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg2
    mov edx, len2
    int 80h
    
    mov eax,SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg3
    mov edx, len3
    int 80h
    
    mov eax,SYS_EXIT
    mov ebx,STDIN
    int 80h