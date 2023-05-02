; display stars
;========================
section .data
    msg db "Display 9 stars",10,0
    len equ $-msg
    s2 times 9 db "*"
    
section .text
global _start
_start:
    mov eax,4
    mov ebx,1
    mov ecx,msg
    mov edx, len
    int 80h
    
    mov eax,4
    mov ebx,1
    mov ecx,s2
    mov edx, 9
    int 80h
    
    mov eax,1
    mov ebx,0
    int 80h
