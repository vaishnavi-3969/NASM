; INTERNAL TO INTERNAL BLOCK TRANSFER: NON-OVERLAPPING
;=========================================================
; This program transfers data from internal RAM to internal RAM

ORG 00H ; origin address of the program
CLR A ; clear the contents of the accumulator

MOV 20H, #01H ; move the data value of 01H into the address 20h
MOV 21H, #02H
MOV 22H, #03H
MOV 23H, #04H
MOV 24H, #05H

MOV R7, #05H ; counter => no. of data blocks to transfer
MOV R0, #20H ; starting address of the source block
MOV R1, #30H ; starting address of the destination block

L1:
    MOV A, @R0 ; copy the content of source address to acccumulator
    MOV @R1, A ; copy the contents of accumulator to destination address
    INC R1 ; increment source address
    INC R2 ; increment destination address
    DJNZ R7, L1 ; decrement the value of R7 and jump to L1 if the value is not zero

END ; end of the progam