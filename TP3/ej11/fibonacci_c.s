	.file	"fibonacci_c.c"
	.intel_syntax noprefix
	.section	.rodata
.LC0:
	.string	"fib(%d) = %d\n"
	.text
	.globl	main
	.type	main, @function
main:
	push	ebp
	mov	ebp, esp
	and	esp, -16
	sub	esp, 32
	mov	DWORD PTR [esp+24], 8
	mov	eax, DWORD PTR [esp+24]
	mov	DWORD PTR [esp], eax
	call	fibonacci_c
	mov	DWORD PTR [esp+28], eax
	mov	eax, DWORD PTR [esp+28]
	mov	DWORD PTR [esp+8], eax
	mov	eax, DWORD PTR [esp+24]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:.LC0
	call	printf
	leave
	ret
	.size	main, .-main
	.globl	fibonacciRec
	.type	fibonacciRec, @function
fibonacciRec:
	push	ebp
	mov	ebp, esp
	sub	esp, 24
	cmp	DWORD PTR [ebp+16], 0
	jne	.L3
	mov	eax, DWORD PTR [ebp+8]
	jmp	.L4
.L3:
	mov	eax, DWORD PTR [ebp+16]
	lea	edx, [eax-1]
	mov	eax, DWORD PTR [ebp+12]
	mov	ecx, DWORD PTR [ebp+8]
	add	eax, ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [ebp+12]
	mov	DWORD PTR [esp], eax
	call	fibonacciRec
.L4:
	leave
	ret
	.size	fibonacciRec, .-fibonacciRec
	.globl	fibonacci_c
	.type	fibonacci_c, @function
fibonacci_c:
	push	ebp
	mov	ebp, esp
	sub	esp, 24
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [esp+8], eax
	mov	DWORD PTR [esp+4], 1
	mov	DWORD PTR [esp], 1
	call	fibonacciRec
	leave
	ret
	.size	fibonacci_c, .-fibonacci_c
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.1) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
