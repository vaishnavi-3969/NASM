section .data msg: db "File does not exist ",OAH 
    len : equ $-msg 
    msg1 db "File successfully copied",OAH 
    len1 equ $-msg1 
    msg2 db "File successfully deleted!!!!",OAH 
    len2 : equ $-msg2 
    msg3 db "Enter the data to be typed in the file",OAH 
    len3 equ $-msg3 
    buffer: times 1000 db ''filelen : dq 0 

section .bss 
    filedes_1: resq 1 
    filedes_2: resq 1 
    filename_1 resb 16 
    filename_2 resb 16 
    choice: resb 8 

section .txt 
global_start 
%macro print 2 
    mov rax, 1 
    mov rdi,1 
    mov rsi,%1 
    mov rdx,%2 
    syscall 
%endmacro 
%macro read 2 
    mov rax,0 mov 
    rdi, 1 mov 
    rsi,%1 mov 
    rdx,%2 
    syscall 
%endmacro 
_start: 
pop rbx 
pop rbx 
pop rbx 
;READ THE CHOICE i.e COPY OR DELETE OR 
TYPE mov [choice],rbx 
mov rsi,qword[choice] 
cmp byte[rsi],43H 
je copy 
cmp byte[rsi],44H 
je Delete 
jmp type 

COPY COMMAND 
copy: pop rbx mov rsi,filename_1 up_1: 
mov al,byte[rbx] mov byte[rsi],al inc rsi inc rbx cmp byte[rbx],OH jne up_1 pop rbx mov 
rsi,filename_2 up_2: mov al,byte[rbx] mov byte[rsi],al inc rbx inc rsi cmp byte[rbx],0H jne up_2 mov rax,2 mov 
rdi,filename_1 ;FIRST FILE 
NAME mov rsi,2; WR MODE 
mov rdx,0777 
syscall bt rax,63 jc 
NoFile mov 
[filedes_1],rax mov 
rax,2 mov 
rdi,filename_2 
mov rsi,2 mov 
rdx,0777 
syscall 
cmp rax,0 jle 
NoFile mov 
[filedes_2],rax mov 
rax,0 mov 
rdi, qword[filedes_1 
] mov rsi,buffer 
mov rdx, 100 
syscall mov 
qword[filelen],rax mov 
rax,1 mov 
rdi,qword[filedes_2] 
mov rsi,buffer 
mov 
rdx,qword[filelen] 
syscall 
mov rax,3 mov 
rdi,filedes_1 
syscall 
mov rax,3 mov 
rdi,filedes_2 syscall 
print msg1,len1 jmp 
exit;DELETE Delete : 
pop rbx mov 
rsi,filename_1 up_3: mov al,byte[rbx] mov byte[rsi],al inc rsi inc 
rbx cmp byte[rbx],OH 
jne up_3 
mov rax,87 mov 
rdi,filename_1 
syscall print 
msg2,len2 jmp 
exit 
;TYPE COMMAND 
type: 
:SAVING FILE NAME 
pop rbx mov 
rsi,filename_1 up_4: 
mov al,byte[rbx] mov 
byte[rsi],al 
inc rsi inc rbx cmp byte[rbx],OH 
jne up_4 
mov rax,2 mov rdi,filename_1 
;FIRST FILE NAME mov rsi,2 
mov rdx,0777 syscall 
cmp rax,1 je NoFile mov 
[filedes_1],rax print 
msg3,len3 read 
buffer, 1000 mov rax,1 
mov rdi,qword[filedes_1] 
mov rsi,buffer mov 
rdx, 1000 
syscall 
mov rax,3 mov 
rdi,filedes_1 
syscall jmp exit 
NoFile: print 
msg,len jmp exit 
exit: 
mov rax,60 
mov rdi.0 
syscall 

; bash-4.4$ nasm -f elf64 -F stabs Assignment7.asm 
; bash-4.4$ ld -o A7 Assignment7.0 
; bash-4.4$ ./A7 type a.txt 
; Enter the data to be typed in the file 
=; bash-4.4$ ./A7 type a.txt 
; Enter the data to be typed in the file 
; bash-4.4$ ./A7 COPY a.txt b.txt 
; File successfully copied bash-4.4$ ./A7 DELETE b.txt File successfully deleted!!!! bash-4.4$ 
