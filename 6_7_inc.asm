%include '5_functions.asm' ; including external file

section .data
    msg1 db "Hello World", 0Ah, 0h
    msg2 db 'This is how we recycle in nasm',0Ah, 0h

section .text
    global _start

_start:
    mov eax,msg1
    call sprint

    mov eax,msg2
    call sprint

    call quit