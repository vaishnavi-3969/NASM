section .data
	msg1 db "Enter the first number : ",0xa
	len1 equ $ - msg1
	msg2 db "Enter the 2nd number : ",0xa
	len2 equ $ - msg2
	msg3 db "The sum is: "
	len3 equ $- msg3

section .bss
	num1 resb 2
	num2 resb 2
	res resb 1

section .text
global _start
_start:

	  mov edx,len1
	  mov ecx,msg1
	  mov ebx,1
	  mov eax,4
	  int 0x80

	  mov edx,2
	  mov ecx,num1
	  mov ebx,0
	  mov eax,3
	  int 0x80

	  mov edx,len2
	  mov ecx,msg2
	  mov ebx,1
	  mov eax,4
	  int 0x80

	  mov edx,2
	  mov ecx,num2
	  mov ebx,0
	  mov eax,3
	  int 0x80

	  mov eax,[num1]
	  sub eax,'0'
	  mov ebx,[num2]
	  sub ebx,'0'

	  add eax,ebx
	  add eax,'0'

	  mov [res],eax

	  mov edx,len3
	  mov ecx,msg3
	  mov ebx,1
	  mov eax,4
	  int 0x80

	  mov edx,1
	  mov ecx,res
	  mov ebx,1
	  mov eax,4
	  int 0x80


	  mov ebx,0
	  mov eax,1
	  int 0x80


