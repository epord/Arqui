GLOBAL fibonacci_asm

section .text

;-------------------------------------
; int fibonacci_asm(int indexFibo)
;-------------------------------------
fibonacci_asm:
	push ebp
	mov ebp, esp
	push ebx

	mov ebx, dword 1
	mov ecx, dword 1
	mov eax, [ebp+8]	; fibonacci's index

	push eax
	push ecx
	push ebx
	call fibonacci_asmRec

	pop ebx
	mov esp, ebp
	pop ebp
	ret


;--------------------------------------------------
; int fibonacci_asmRec(int a, int b, int indexFibo)
;--------------------------------------------------
fibonacci_asmRec:
	push ebp
	mov ebp, esp
	push ebx

	mov ebx, [ebp+8]	; argument a
	mov ecx, [ebp+12]	; argument b
	mov eax, [ebp+16]	; fibonacci's index

	cmp eax, 0
	jz _end

	dec eax				; indexFibo--
	add ebx, ecx		; a = a + b
	push eax			; argument indexFibo
	push ebx			; argument b
	push ecx			; argument a
	call fibonacci_asmRec
	jmp _clc_stackframe

_end:
	mov eax, ebx		; return a

_clc_stackframe:
	pop ebx
	mov esp, ebp
	pop ebp
	ret
