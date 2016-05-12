GLOBAL sys_write

sys_write:
	push ebp
	mov ebp, esp

	push ebx	 ; preservo ebx

	mov eax, 0x4	 ; syscall write
	mov ebx, [ebp+8] ; fd
	mov ecx, [ebp+12]; buffer
	mov edx, [ebp+16]; length
	int 0x80

	pop ebx

	mov esp, ebp
	pop ebp
	ret
