section .data
; performing arithmetic and logical operations for single digit
   msg1 db 'Enter the num1',0xa,0xd
   len1 equ $-msg1
   msg2 db 'Enter the num2',0xa,0xd
   len2 equ $-msg2
   msg3 db 'Addition of number :',0xa,0xd
   len3 equ $-msg3
   msg4 db 'Subtraction of number :',0xa,0xd
   len4 equ $-msg4
   msg5 db 'Multiplication of the number',0xa,0xd
   len5 equ $-msg5
   msg6 db 'Division of number :',0xa,0xd
   len6 equ $-msg6
   msg7 db 'Result of OR operation: ',0xa,0xd
   len7 equ $-msg7
   msg8 db 'Result of AND operation: ',0xa,0xd
   len8 equ $-msg8
   msg9 db 'Result of XOR operation: ',0xa,0xd
   len9 equ $-msg9
   msg10 db 'Result of XOR operation: ',0xa,0xd
   len10 equ $-msg10



segment .bss

   num1 resb 2
   num2 resb 2
   sum  resb 1
   len equ $-sum
   subt resb 1
   divi resb 1
   multi resb 1
   lenm equ $-sum
   result resb 1


section .text
   global _start       ;must be declared for using gcc
_start:                    ;tell linker entry point


   ; display message to enter the msg1
   mov eax,4       
   mov ebx,1
   mov ecx,msg1
   mov edx,len1
   int 80h

   ; to accept the string 1
   mov eax,3           
   mov ebx,0
   mov ecx,num1
   mov edx,2
   int 80h

  ; display message to enter the string2
   mov eax,4         
   mov ebx,1
   mov ecx,msg2
   mov edx,len2
   int 80h

  ; to accept the string 2
   mov eax,3          
   mov ebx,0
   mov ecx,num2
   mov edx,2
   int 80h
   
   mov eax,[num1]
   sub eax,'0'
   mov ebx,[num2]
   ; subtract to convert ascii into decimal
   sub ebx,'0'
   add eax,ebx
   ; to convert decimal into ascii again
   add eax,'0'
   mov [sum],eax

   ; to display msg of sum op
   mov eax,4
   mov ebx,1
   mov ecx,msg3
   mov edx,len3
   int 80h
   
   ; to display sum op
   mov eax,4
   mov ebx,1
   mov ecx,sum
   mov edx,len
   int 80h

   mov eax,[num1]
   ; subtract to convert ascii into decimal
   sub eax,'0'
   mov ebx,[num2]
   sub ebx,'0'
   sub eax,ebx
   ; to convert decimal into ascii again
   add eax,'0'
   mov [subt],eax

    ; to display msg of sub op
   mov eax,4
   mov ebx,1
   mov ecx,msg4
   mov edx,len4
   int 80h

   ; to display sub op
   mov eax,4
   mov ebx,1
   mov ecx,subt
   mov edx,1
   int 80h  
 
   mov eax,[num1]
   sub eax,'0'
   mov ebx,[num2]
   sub ebx,'0'
   mul ebx
   add eax,'0'
   mov [multi],eax 

   ; to display msg of mul op
   mov eax,4
   mov ebx,1
   mov ecx,msg5
   mov edx,len5
   int 80h
   
  ; to display mul op
   mov eax,4
   mov ebx,1
   mov ecx,multi
   mov edx,1
   int 80h

   mov al,[num1]
   sub al,'0'
   mov bl,[num2]
   sub bl,'0'
   div bl
   add al,'0'
   mov [divi],al

   ; to display msg of divi op
   mov eax,4
   mov ebx,1
   mov ecx,msg6
   mov edx,len6
   int 80h
   
   ; to display divi op
   mov eax,4
   mov ebx,1
   mov ecx,divi
   mov edx,1
   int 80h

   ; to display msg of  op
   mov eax,4
   mov ebx,1
   mov ecx,msg7
   mov edx,len7
   int 80h

   mov eax,[num1]
   sub eax,'0'
   mov ebx,[num2]
   sub ebx,'0'
   OR eax, ebx
   add eax,'0'
   mov [result], eax

   ; to display op
   mov eax, 4
   mov ebx, 1
   mov ecx, result
   mov edx, 2
   int 80h
 
    mov eax, [num1]
   mov ebx, [num2]
   and eax, ebx
   mov [result], eax

   ; to display msg of op
   mov eax, 4
   mov ebx, 1
   mov ecx, msg8
   mov edx, len8
   int 0x80

   ; to display op
   mov eax, 4
   mov ebx, 1
   mov ecx, result
   mov edx, 2
   int 0x80

   ; to display msg of op
   mov eax, 4
   mov ebx, 1
   mov ecx, msg9
   mov edx, len9
   int 0x80

   mov eax,[num1]
   sub eax,'0'
   mov ebx,[num2]
   sub ebx,'0'
   XOR eax,ebx
   add eax,'0'

   mov [result], eax

   ; to display op
   mov eax, 4
   mov ebx, 1
   mov ecx, result
   mov edx, 2
   int 80h

   mov eax,1
   mov ebx,0
   int 80h

