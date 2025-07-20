
section .data
	napis db "test", 0xa, 0

section .text 
	global _start	

_start:
	mov rax, 1
	mov rdi, 1
	mov rsi, napis
	mov rdx, 5
	syscall

	mov rax, 60
	mov rdi, 0
	syscall
