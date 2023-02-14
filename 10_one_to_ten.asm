%include '4_functions.asm'

section .text
global _start
_start:
    mov ecx,0

sprintLF:
    call    sprint

    push    eax         ; push eax onto the stack to preserve it while we use the eax register in this function
    mov     eax, 0Ah    ; move 0Ah into eax - 0Ah is the ascii character for a linefeed
    push    eax         ; push the linefeed onto the stack so we can get the address
    mov     eax, esp    ; move the address of the current stack pointer into eax for sprint
    call    sprint      ; call our sprint function
    pop     eax         ; remove our linefeed character from the stack
    pop     eax         ; restore the original value of eax before our function was called
    ret                 ; return to our program

nextNumber:
    inc ecx
    mov eax,ecx
    add eax,48
    push eax
    mov eax, esp ; get the address of characters onto stack
    call sprintLF; calling the print function

    pop eax
    cmp ecx,10
    jne nextNumber

    call quit