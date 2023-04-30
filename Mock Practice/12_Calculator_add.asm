; add eax and ebx -> eax ans
; load eax w/ int
; mov into ebx
;add -> addition
;----------------------
;Calculator(Addition)

%include '5_functions.asm'

section .text
global _start
_start:
    mov eax,30
    mov ebx,8
    add eax,ebx
    call iprintLF
    call quit