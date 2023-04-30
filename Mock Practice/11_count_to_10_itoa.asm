;4949 -> ascii rep of 10
; repeatedly divide the no. by 10 an add 48
; each time convert the remainder to a string by adding 48
; push onto stack for later use
; popping them off the stack moves esp forward to the next item on the stack
; each time we print we decrease our counter ecx
;once all the nos have been converted and printed we return the program

; div and idiv: dividing whatever is in eax by the value passed to the instruction
;quotient part -> left -> eax
; remainder part -> edx -> data register
;-------------
;idiv eg.
;mov eax,10
;mov esi,10 -> eax = 1, edx = 0
;idiv esi -> eax=0, edx=1
;------------

% include '5_functions.asm'
section .text
    global _start
_start:
    mov ecx,0

nextNumber:
    inc ecx
    mov eax,ecx
    call iprintLF
    jne nextNumber

    call quit
