; creating and opening a file 
;==============================
section .data
    file_name db 'vaishnavi.txt'
    msg db "Hello world"
    len equ $-msg
    
    msg_done db "Write to file",0
    len_done equ $-msg_done

section .bss
    fd_out resb 1
    fd_in resb 1
    info resb 26

section .text
    global _start
_start:
    ; create a file
    mov eax,8
    mov ebx,file_name
    mov ecx, 0777; read, write and execute by all
    int 80h
    
    mov [fd_out], eax
    
    ; write into the file
    mov eax, 4 ; sys_write
    mov ebx, [fd_out]
    mov ecx, msg ; msg to write
    mov edx, len
    
    ; close the file
    mov eax,6
    mov ebx, [fd_out]
    
    ; write the message indicating end of file write
    mov eax,4
    mov ebx,1
    mov ecx, msg_done
    mov edx, len_done
    int 80h
    
    ; open the file for reading
    mov eax,5
    mov ebx,file_name
    mov ecx, 0 ; for read only access
    mov edx,0777
    int 80h
    
    mov [fd_in],eax
    
    ; read from the file
    mov eax,3
    mov ebx,[fd_in]
    mov ecx, info
    mov edx, 26
    int 80h
    
    ; close the file
    mov eax,6
    mov ebx,[fd_in]
    int 80h
    
    ; print info
    mov eax,4
    mov ebx,1
    mov ecx, info
    mov edx, 26
    int 80h
    
    mov eax,1; sys_exit
    mov ebx,0
    int 80h