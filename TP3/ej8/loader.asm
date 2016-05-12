section .text

GLOBAL _start
EXTERN main

_start:
	call main
	mov ebx, eax	; retorno de main en ebx
	mov eax, 1		; sys_exit con retorno ebx
	int 80h
