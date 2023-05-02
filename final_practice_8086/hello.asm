section .data:
    msg db "Hello, World", 10, 0
    len equ $-msg

section .text
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, len
    int 80h

    mov eax, 1
    mov ebx, 0
    int 80h


; $ nasm -f elf32 -o hello.o hello.asm
; $ ld -m elf_i386 -o hello hello.o