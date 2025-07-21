section .data
	msg db "The largest digit is: ", 0xA, 0xD
	len equ $ - msg
	num1 dd "47"
	num2 dd "22"
	num3 dd "31"

section .bss
	largest resb 2

section .text
	global _start

_start:
	mov ecx, [num1]
	cmp ecx, [num2]
	jg check_third_num
	mov ecx, [num2]

check_third_num:
	cmp ecx, [num3]
	jg print_mess
	mov ecx, [num3]

print_mess:
	mov [largest], ecx

	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, len
	int 0x80
	
	mov eax, 4
	mov ebx, 1
	mov ecx, largest
	mov edx, 2
	int 0x80

	jmp exit

exit:
	mov eax, 1
	int 0x80
