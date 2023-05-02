ORG 00H
MOV A, #11001100b  ; Load A with binary 11001100
MOV B, #10101010b  ; Load B with binary 10101010
ANL A, B           ; Perform bitwise AND between A and B, result in A
END