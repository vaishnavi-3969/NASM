BITS     32

section  .data
         str1      db "Hello World",10    ; 10 ->ascii for next line
         strLen    equ $-str1

section  .bss
         input     resb 4
section  .text
         global    _start:

_start:
         mov       ecx,5
    
l1:
         push      ecx
         mov       eax,4
         mov       ebx,1
         mov       ecx,str1
         mov       edx,strLen
         int       80h
         pop       ecx
loop     l1

         mov       eax,1
         mov       ebx,0
         int       80h