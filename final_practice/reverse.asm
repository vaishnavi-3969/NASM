; reverse code
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
    str1 resb 10
    rev resb 10
    lenstr resb 2

section .data
    msg1 db "Enter the string: ",10,0
    len1 equ $-msg1
    msg2 db "Enter the string length: ",10,0
    len2 equ $-msg2
    msg3 db "String reverse: ",10,0
    len3 equ $-msg3

section .text
global _start
_start:
    display msg1,len1 ; displays msg to enter the string
    read str1,10    ; inputs no. from user
    jmp reverse ; jump to reverse

reverse:
    mov esi,str1; string to be reversed
    mov edi,rev
    mov cl,al; counter containing the length of the string
    add esi,eax; reaches to the end of the string + 1
    dec esi; end of string
    L1:
        mov al,byte[esi] ; move character by character to al from esi
        mov byte[edi],al    ; move character by character to edi through al
        inc edi ; increment edi as it points to starting of string
        dec esi ; decrements esi as it points to end of the string
        dec cl  ; decrement counter
        jnz L1  ; continue loop if the counter doeesn't reach zero
        display rev,10  ; display reverse string
        int 80h;    ; end

exit:
    mov eax,1
    mov ebx,0
    int 80h