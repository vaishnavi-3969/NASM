; integer printing fn
iprint:
    push eax
    push ecx
    push edx
    push esi
    mov ecx,0

divideLoop:
    inc ecx; count each byte to print - no. of chars
    mov edx,0
    mov esi,10
    idiv esi
    add edx,48 ;-> edx holds remainder
    push edx
    cmp eax,0 ; check if the intger can be divided anymore
    jnz divideLoop

printLoop:
    dec ecx ; count down each byte that we put on the stack
    mov eax,esp; for printing
    call sprint
    pop eax; remove last char to move to esi
    cmp ecx,0; have we printed everything on stack
    jnz printLoop

    pop esi
    pop edx
    pop ecx
    pop eax
    ret

;Integer printring fn witrh linefeed
iPrintLF:
    call iprint
    push eax; to preserve it while we use thea eax register
    mov eax,esp ;linefeed
    mov eax,esp; addr of the curr stack ptr into eax for spprint
    call sprint
    pop eax; remove linefeed character from stack
    pop eax; restore original value of eax beofre our fn was called
    ret

    ;---------------------

; calculating the length of the string
slen:
    push ebx
    mov ebx,eax

nextchar:
    cmp byte[eax],0
    jz finished
    inc eax
    jmp nextchar

finished:
    sub eax,ebx
    pop ebx
    ret

;-----------------------------
; string printing msg
sprint:
    push eax
    push ebx
    push ecx
    push edx
    call slen

    mov edx,eax
    pop eax

    mov ecx,eax
    mov ebx,1
    mov eax,4
    int 80h
;------------------
;string printing with linefeed fn
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

quit:
    mov ebx,0
    mov eax,1
    int 80h
    ret
