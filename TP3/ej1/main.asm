GLOBAL main
EXTERN printf

section .rodata
	fmt db "Cantidad de argumentos: %d", 10, 0
	fmt2 db "%s", 10, 0

section .text

main:
	push ebp			; armado de stack frame
	mov ebp, esp

	mov ebx, dword [esp+8]  	; guarda cantidad de argumentos en ebx

	push ebx			; imprime cantidad de argumentos
	push fmt
	call printf
	add esp, 2*4

	mov esp, [esp+12]		; esp+12 tiene un puntero a la lista de argumentos

printElems:
	push dword [esp]
	push fmt2
	call printf
	add esp, 2*4

	add esp, 4			; esp apunta al siguiente argumento

	dec ebx
	cmp ebx, 0
	jne printElems

end:
	mov esp, ebp			; desarmado del stack frame
	pop ebp
	ret
