BITS 32

%macro EpicPrint 2
    mov eax,4
    mov ebx,1
    mov ecx,%1
    mov edx,%2
    
    int 80h
%endmacro
    
section .data
    hello: db "Hello World!",10
    helloLen equ $-hello

section .text
	global _start:

_start:
    EpicPrint hello, helloLen
    EpicPrint hello, helloLen
    EpicPrint hello, helloLen
    EpicPrint hello, helloLen
    
	mov eax,1
	mov ebx,0
	int 80h