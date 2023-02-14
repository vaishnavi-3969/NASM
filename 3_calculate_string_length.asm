section .data
    msg db "Hello world Vaishnavi!", 0Ah
    msgLen equ $-msg

section .text
    global _start
_start:
    mov ebx,msg
    mov eax,ebx
 
    nextChar:
        cmp byte[eax],0
        jz finished
        inc eax
        jmp nextChar

    finished:
        sub eax,ebx

        mov eax,4
        mov ebx,1
        mov ecx,msg
        mov edx,eax
        int 80h

    mov eax,1
    mov ebx,0
    int 80h
