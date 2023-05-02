section .data
    msg db "Vaishnavi Kale"

section .text
global _start
_start:
    ; writing the name
    mov eax,4
    mov ebx,1
    mov ecx,msg
    mov edx,9
    
    mov [msg], dword 'Tanishq' ; changed the name to vaishnavi
    
    ; writing the name
    mov eax, 4
    mov ebx,1
    mov ecx, msg
    mov edx, 7
    int 80h
    
    mov eax,1
    mov ebx,0
    int 80h