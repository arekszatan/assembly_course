section .data
	msg db "The result of multiplied 3 and 2 is: ", 0xA, 0xD
	len equ $ - msg

section .bss
	res resb 1

section .text
	global _start

_start:
	mov al, "3"
	sub al, "0"
	
	mov bl, "2"
	sub bl, "0"
	mul bl
	add al, "0"

	mov [res], al
	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, len
	int 0x80
	
	mov eax, 4
	mov ebx, 1
	mov ecx, res
	mov edx, 1
	int 0x80

	mov eax, 1
	int 0x80
