section  .data
         msg       db 'Hello World!',10

section  .text
         global    _start
_start:
         mov       eax,4
         mov       ebx,1
         mov       ecx,msg
         mov       edx,13
         int       80h