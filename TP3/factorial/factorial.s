	.file	"factorial.c"
	.intel_syntax noprefix
	.text
	.globl	factorial
	.type	factorial, @function
factorial:
	push	ebp
	mov	ebp, esp
	sub	esp, 40
	cmp	DWORD PTR [ebp+8], 0
	jne	.L2
	mov	eax, 1
	jmp	.L3
.L2:
	mov	eax, DWORD PTR [ebp+8]
	sub	eax, 1
	mov	DWORD PTR [esp], eax
	call	factorial
	mov	DWORD PTR [ebp-12], eax
	mov	eax, DWORD PTR [ebp+8]
	imul	eax, DWORD PTR [ebp-12]
.L3:
	leave
	ret
	.size	factorial, .-factorial
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.1) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
