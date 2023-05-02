; develop a suitable application alp with the help of timer, counter

ORG 300H ; code will be stored in memory starting from address 300h
MSG1: DB 6,'LED ON'

ORG 310H ; next message will be stored at address 310h
MSG2: DB 7,'LED OFF'
CTR EQU 310H ; defines a constant 31h

ORG 00H ; sets the program coutner to address 00h
CLR P1.2 ; sets the pin 2 of port 1 as low to turn off the led
MOV TMOD, #10H ; sets the timer in mode 1

BACK: MOV CTR,#26H
; up: count 25h in timer 1
UP: MOV TL1, #25H
    MOV TH1, #00H
    SETB TR1 ; starts the timer and the program waits until the timer flag tf1 is set
    ; once tf1 is set, tr1 is cleared and the program enters the loop
HERE: JNB TF1, HERE ; checks if the tr1 is clear
    CLR TR1 
    CLR TF1
    DJNZ CTR,UP
    ; the loop continues until ctr becomes zero
    ; once it becomes zero, P1.2 is complemented using cpl to turn on led
    CPL P1.2
    JNB TR1,LED_OFF ; checks if tr1 is clear, if it is clear, the program jumps to led_off
    LCALL 0E01EH 
    LJMP NEXT

LED_OFF: LCALL 0E012H ; used to delay for sometime
        MOV R2, #03H
        MOV R3, #10H
        ; above 2 instructions are used to set values of registers r2 ,r3
        LCALL 0E01EH ; display the msg "LED ON" or "LED OFF" on the lcd
NEXT:SJMP BACK ; repeat the process again and again