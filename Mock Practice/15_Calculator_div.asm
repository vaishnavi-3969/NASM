%include '5_functions.asm'

section .data
    msg db ' remainder '

section .text
global _start
_start:
    mov eax,30
    mov ebx,8
    div ebx
    call iprint
    mov eax,msg1
    call sprint
    mov eax,edx ; move remainder into eax
    call iprintLF; linefeed fn
    call quit