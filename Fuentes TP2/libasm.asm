
GLOBAL print
GLOBAL println
GLOBAL exit
GLOBAL toString

section .text

;-----------------------------------------------------------
; print - imprimer una cadena en la salida estandar
;-----------------------------------------------------------
; Argumentos:
;	ebx: cadena a imprimer en pantalla, terminada con 0
;-----------------------------------------------------------
print:
	pushad		; hago backup de los registros

	call strlen
	mov ecx, ebx	; la cadena esta en ebx
	mov edx, eax	; en eax viene el largo de la cadena

	mov ebx, 1		; FileDescriptor (STDOUT)
	mov eax, 4		; ID del Syscall WRITE
	int 80h
	
	popad 		; restauro los registros
	ret	

;-----------------------------------------------------------
; println - imprimer una cadena en la salida estandar con enter
;-----------------------------------------------------------
; Argumentos:
;	ebx: cadena a imprimer en pantalla, terminada con 0
;-----------------------------------------------------------
println:
	pushad		; hago backup de los registros

	call print
	mov ecx, nuevaLinea	; imprimo enter
	mov edx, 2	; longitud es 1

	mov ebx, 1	; FileDescriptor (STDOUT)
	mov eax, 4	; ID del Syscall WRITE
	int 80h
	
	popad 		; restauro los registros
	ret	
	
;-----------------------------------------------------------
; exit - termina el programa
;-----------------------------------------------------------
; Argumentos:
;	ebx: valor de retorno al sistema operativo
;-----------------------------------------------------------
exit:
	mov eax, 1		; ID del Syscall EXIT
	int 80h			; Ejecucion de la llamada


;-----------------------------------------------------------
; strlen - calcula la longitud de una cadena terminada con 0
;-----------------------------------------------------------
; Argumentos:
;	ebx: puntero a la cadena
; Retorno:
;	eax: largo de la cadena
;-----------------------------------------------------------
strlen:
	push ecx ; preservo ecx	
	push ebx ; preservo ebx
	pushf	; preservo los flags

	mov ecx, 0	; inicializo el contador en 0
.loop:			; etiqueta local a strlen
	mov al, [ebx] 	; traigo al registo AL el valor apuntado por ebx
	cmp al, 0	; lo comparo con 0 o NULL
	jz .fin 	; Si es cero, termino.
	inc ecx		; Incremento el contador
	inc ebx
	jmp .loop
.fin:				; etiqueta local a strlen
	mov eax, ecx	
	
	popf
	pop ebx ; restauro ebx	
	pop ecx ; restauro ecx
	ret
	
;-----------------------------------------------------------
; toString - convierne un int a un string
;-----------------------------------------------------------
; Argumentos:
;	eax: número a convertir
; Retorno:
;	edi: string
;-----------------------------------------------------------

toString:	
	
	push eax ; preservo eax	
	push edi ; preservo edi
	push edx ; preservo edx
	push ecx ; preservo ecx
	push ebx ; preservo ebx
	pushf	 ; preservo los flags

	mov ecx, 0	; acumula la cant de digitos
	mov ebx, 10	
	

.loop2:	mov edx, 0	; recibirá el resto
	div ebx		; divide por 10
	push edx	; guarda el resto en el stack
	inc ecx		; incrementa el acumulador
	cmp eax, 0
	jnz .loop2	; termina si no se puede seguir dividiendo

.loop3: pop eax			; se popea el último resto
	add eax,30h		; se convierte de int a char
	mov dword [edi], eax	; se copia al registro de salida
	inc edi
	dec ecx
	jnz .loop3		; termina el ciclo cuando ya se copiaron todos los caracteres
	
	mov [edi], dword 0	; \0 del final del string

	popf
	pop ebx ; restauro ebx
	pop ecx ; restauro ecx
	pop edx ; restauro edx
	pop edi ; restauro edi	
	pop eax ; restauro eax
	ret	

section .data
	nuevaLinea db "", 10, 0
