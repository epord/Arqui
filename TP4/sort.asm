section .bss
	arr resb 20
	size equ $-arr

section .text
GLOBAL main


main:
	push ebp
	mov ebp, esp

	mov [arr], dword 1
	mov [arr+4], dword 6
	mov [arr+8], dword 9
	mov [arr+12], dword 3
	mov [arr+16], dword 5

	push arr
	push size
	call sort
	leave
	ret

sort:
	push ebp
	mov ebp, esp
	push ebx

	mov eax, [ebp+16]		; arr in eax
	mov ecx, dword 0	; index i
.loopi:
	cmp ecx, [ebp+8]		; compare with size
	jge .endloopi
	mov edx, dword 0	; index j
.loopj:
	mov ebx, [ebp+8]
	sub ebx, ecx		; ebx = length - i
	jg .endloopj
	mov ebx, [eax+4*edx]; ebx = arr[j]
	mov edi, [eax+4*ecx]; edi = arr[i]
	cmp ebx, edi
	jl .next
	pushad
	push edx	; push j
	push ecx	; push i
	push arr
	;call swap
	add ebp, 4*3
	popad
.next:
	inc edx
.endloopj:
	inc ecx
	jmp .loopi
.endloopi:
	pop ebx
	mov esp, ebp
	pop ebp
	ret
