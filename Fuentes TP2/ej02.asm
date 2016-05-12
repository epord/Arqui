section .text
GLOBAL _start

EXTERN print
EXTERN println
EXTERN exit
EXTERN toString

_start:
	mov ebx, 100
	call sum	; suma los primeros 10 numeros
	mov edi, intToString
	call toString 	; convierte el número calculado en string
	mov ebx, edi
	call println	; imprime el string

	mov edx,5
	mov ecx, 16
	call multiplos

	mov ebx, 0	; valor de retorno
	call exit

;-----------------------------------------------------
; multiplos - imprime multiplos de n menores a k
;-----------------------------------------------------
; Argumentos:
;	edx: n
;	ecx: k
;-----------------------------------------------------

multiplos:
	pushad			; preserva los registros

	mov edi, intToString
	mov eax, 0		; guarda los multiplos a imprimir
	cmp edx, 0
	jz .multiplos0		; jump si n=0
	cmp edx, ecx
	ja .multiplosFin	; retorna si n>k
	jmp .multiplosN

.multiplos0:
	call toString
	mov ebx, edi
	call println		; solo imprime el 0
	jmp .multiplosFin

.multiplosN:
	add eax, edx
	cmp eax, ecx
	ja .multiplosFin	; jump si eax > ecx
	call toString
	mov ebx, edi
	call println
	jmp .multiplosN 

.multiplosFin:
	popad	; restaura los registros
	ret
	





;-----------------------------------------------------
; sum - suma los primeros n numeros naturales
;-----------------------------------------------------
; Argumentos:
;	ebx: n
; Retorno:
;	eax: suma de los primeros n números naturales
;-----------------------------------------------------
sum:
	push ebx	; preservo ebx
	push ecx	; preservo ecx
	pushf		; preservo los flags

	mov eax, 0
	cmp ebx, 0
	jz .endSum	; si ebx=0 retorna 0

.sumando:
	add eax, ebx			
	dec ebx		; decremento contador
	jnz .sumando

.endSum:
	popf		; restauro los flags
	pop ecx		; restauro ecx
	pop ebx		; restauro ebx
	ret

;-----------------------------------------------------------
; toMayus - convierte minúsculas a mayúsculas
;-----------------------------------------------------------
; Argumentos:
;	ebx: cadena a convertir, terminada con 0
;-----------------------------------------------------------
toMayus:
	push ebx ; preservo ebx
	pushf	 ; preservo los flags

.loop:
	mov al, [ebx] 	; traigo al registo AL el valor apuntado por ebx
	cmp al, 0	; lo comparo con 0 o NULL
	jz .fin 	; Si es cero, termino.
	cmp al, 61h	; comparo con "a"
	jle .increm	; salta a loop si es <"a"
	cmp al, 7Ah	; comparo con "z"
	jge .increm	; salta a loop si es <"z"
	sub al, 20h	; paso de minúscula a mayúscula
	mov [ebx], al
.increm:
	inc ebx
	jmp .loop

.fin:
	popf
	pop ebx 	; restauro ebx	
	ret

section .data
	cadena db "h4ppy c0d1ng", 10, 0

section .bss
	intToString resb 128
