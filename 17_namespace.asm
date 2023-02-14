; namespace: necessary construct in any s/w project that involves
; a codeabase i.e. > a few simple fn
; namespace provide scope to our identifiers and allows you to reuse
; naming conventions to make our code more readable and maintaineable
; in assembly lang. where subrountines are identified by glboal labels
; namespace can be acheived by usingm local labels
; local labels are prepended with a . at the beginning of their name
;eg. .finished
; we can jmp to local label by using the jmp instruction
; compiler will local label we are referencing by determining in what scope the instruction was acalled

;---------------------------------
%include '16_functions.asm'

section .data
    msg1 db 'Jumping to finished label.',0h
    msg2 db 'Inside subroutine no.: ',0h
    msg3 db 'Inside subroutine "finished".',0h

section .text
global _start
_start:

subrountineOne:
    mov eax,msg1 ; move the addr of msg1 into eax
    call sprintLF; string printing with linefeed fn
    jmp .finished; jmp to local label udner the subroutine 1 scope

.finished:
    mov eax,msg2
     call sprint
     mov eax,1
     call iprintLF

subroutineTwo:
    mov eax,msg1
    call sprintLF
    jmp .finished

.finished:
    mov eax,msg2
    call sprint
    mov eax,2
    call iprintLF; w/ linefeed fn

    mov eax,msg1
    call sprintLF
    jmp finished; jmp to global label finished

finished:
    mov eax,msg3
    call sprintLF
    call quit

