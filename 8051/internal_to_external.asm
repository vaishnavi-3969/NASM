; internal to external block transfer
;==================================================
ORG 00
CLR A
MOV 20H, #01H
MOV 21H, #02H
MOV 22H, #03H
MOV 23H, #04H
MOV 24H, #05H

MOV R7, #05H ; NO. OF BLOCKS TO TRANSFER
MOV R0, #20H ; SOURCE ADDRESS
MOV DPTR, #2000H ; EXTERNAL MEMORY ADDRESS

LOOP:
    MOV A, @R0 ; MOVE THE SOURCE ADDRESS CONTENTS TO ACCUMULATOR
    MOVX @DPTR, A ; MOVE THE CONTENTS OF ACCUMULATOR TO DATA POINTER 
    INC DPTR ; INCREMENT THE DATA POINTER
    INC R0 ; INCREMENT THE SOURCE ADDRESS
    DJNZ R7, LOOP ; DECREMENT THE NO. OF BLOCKS TO TRANSFER
 
END