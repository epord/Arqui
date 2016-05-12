
GLOBAL print
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
	
;------------------------
;Recibe el numero en EAX
;recibe la posicion de memoria en EDI
;-----------------------
toString:	
	
	push eax ; preservo eax	
	push edi ; preservo ebx
	push edx
	push ecx
	push ebx
	pushf	; preservo los flags

	mov ecx, 0	; acumula la cant de digitos
	mov ebx, 10	
	

.loop2:	mov edx, 0	; recibira el resto
	;div dword 10		; divide por 10
	div ebx
	push edx
	inc ecx		;acumulador
	cmp eax, 0
	jnz .loop2

.loop3: pop eax
	add eax,30h
	mov dword [edi],eax
	inc edi
	dec ecx
	jnz .loop3
	
	mov [edi], dword 0
	popf
	pop ebx
	pop ecx
	pop edx ;
	pop edi ; restauro edi	
	pop eax ; restauro eax
	ret	
		

	


