atoi:
; ascii to integer fn
    push ebx
    push ecx
    push edx
    push esi
    mov esi,eax
    mov eax,0; initialization
    mov ecx,0; init

.multiplyLoop:
    xor ebx,ebx; reset lower and upper byte to 0
    mov bl, [esi+ecx]; move single byte into ebx's lower half
    cmp bl,48; cmp with 0
    jl .finished; jmp if <label finished
    cmp l,57; cmp with 9
    jg .finished ; jmp if >label finished

    sub bl,48; convert ebx's loewr half to decimal
    add eax,ebx; add ebx to int value in eax
    mov ebx,10 ; decimal value
    mul ebx
    inc ecx; counter
    jmp .multiplyLoop

.finished:
    cmp ecx,0 ; decimal 0 , counter
    je .restore; no args were passed to atoi
    mov ebx,10
    div ebx

.restore:
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret