	.file	"main.c"
	.intel_syntax noprefix
	.globl	arr
	.data
	.align 4
	.type	arr, @object
	.size	arr, 16
arr:
	.long	1
	.long	2
	.long	3
	.long	4
	.text
	.globl	main
	.type	main, @function
main:
	push	ebp
	mov	ebp, esp
	pop	ebp
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.1) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
