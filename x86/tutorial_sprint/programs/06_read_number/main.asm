section .data ; data segment
	user_msg db "Please enter a number:" ; Ask the user to enter a number
	len_user_msg equ $ - user_msg ; The length of the message
	display_msg db "You have entered: "
	len_display_msg equ $ - display_msg

section .bss ; Unitialized data
	num resb 5

section .text ; Code segment
	global _start

_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, user_msg
	mov edx, len_user_msg
	int 0x80

	; Read and store the user input
	mov eax, 3
	mov ebx, 2
	mov ecx, num
	mov edx, 5 ; 5 bytes (numeric, 1 for sign) of that information
	int 0x80
	
	;Output the message 'The entered number is:'
	mov eax, 4
	mov ebx, 1
	mov ecx, display_msg
	mov edx, len_display_msg
	int 0x80
	
	; Output the number entered
	mov eax, 4
	mov ebx, 1
	mov ecx, num
	mov edx, 5
	int 0x80
	
	; exit code
	mov eax, 1
	mov ebx, 0
	int 0x80

