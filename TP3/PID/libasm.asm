GLOBAL pid


;--------------------------------------
;	pid: devuelve el pid del programa
;--------------------------------------

pid:
	push ebp
	mov ebp, esp

	mov eax, 0x14		;syscall getpid
	int 0x80

	mov esp, ebp
	pop ebp
	ret
