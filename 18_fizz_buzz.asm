; group word game
; divisible by 3 -> fizz
; divisible by 5 -> buzz
; divisible by both -> fizzbuzz
%include '16_functions.asm'

section .data
    fizz db 'Fizz', 0h
    buzz db 'Buzz',0h

section .text
global _start:
_start:
    mov esi,0
    mov edi,0
    mov ecx,0; counter variable

nextNumber:
    inc ecx

.checkFizz:
    mov edx,0; will hold remainder after division
    mov eax,ecx;' for division
    mov ebx,3
    div ebx
    mov edi,edx; move our remainder into edi(checkFizz boolean var)
    cmp edi,0 ; cmp if remainder is 0(counter divides by 3)
    jne .checkBuzz
    mov eax,fizz
    call sprint

.checkBuzz:
        mov edx,0; will hold remainder after division
        mov eax,ecx;' for division
        mov ebx,5
        div ebx
        mov edi,edx; move our remainder into edi(checkFizz boolean var)
        cmp edi,0 ; cmp if remainder is 0(counter divides by 3)
        jne .checkBuzz
        mov eax,fizz
        call sprint

.checkInt:
    cmp edi,0 ; edi -> remainder after division in checkFizz
    je .continue
    cmp esi, 0
    je .continue
    mov eax,ecx; move for printing
    call iprint

.continue:
    mov eax,0Ah; ascii linefeed char
    push eax; push addr of eax
    mov eax,esp; addr on the staqck of our linefeed char
    call sprint
    pop eax
    cmp ecx,100
    jne nextNumber

    call quit
