	.file	"testNum.c"
	.intel_syntax noprefix
	.data
	.align 4
	.type	numero, @object
	.size	numero, 4
numero:
	.long	10
	.text
	.globl	main
	.type	main, @function
main:
	push	ebp
	mov	ebp, esp
	mov	DWORD PTR numero, 20
	pop	ebp
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.1) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
