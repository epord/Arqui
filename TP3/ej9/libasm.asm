
;------------------------------------------------------------------------------
; VER: www.tutorialspoint.com/assembly_programming/assembly_file_managment.htm
;------------------------------------------------------------------------------

GLOBAL sys_open
GLOBAL sys_close
GLOBAL sys_write
GLOBAL sys_read

;---------------------------------------------------
; sys_open(char* file_descriptor, int access_mode);
;---------------------------------------------------
sys_open:
	push ebp
	mov ebp, esp

	push ebx			; preservo ebx

	mov eax, 5			; para el sys_call
	mov ebx, [ebx+8]	; file descriptor
	mov ecx, [ecx+12]	; access mode (read-only(0), write-only(1), read-write(2)
	mov edx, 777		; full permissions
	int 80h

	pop ebx

	mov esp, ebp
	pop ebp
	ret



;---------------------------------------------------
; sys_close(char* file_descriptor);
;---------------------------------------------------
sys_close:
	push ebp
	mov ebp, esp

	push ebx			; preservo ebx

	mov eax, 6			; para el sys_call
	mov ebx, [ebx+8]	; file descriptor
	int 80h

	pop ebx

	mov esp, ebp
	pop ebp
	ret	


;-----------------------------------------------------------------
; sys_write(char* file_descriptor, char* input_buffer, int size);
;-----------------------------------------------------------------
sys_write:
	push ebp
	mov ebp, esp

	push ebx			; preservo ebx

	mov eax, 4			; para el sys_call
	mov ebx, [esp+8]	; file descriptor
	mov ecx, [esp+12]	; input buffer
	mov edx, [esp+16]	; size to write
	int 80h

	pop ebx

	mov esp, ebp
	pop ebp
	ret	



;-----------------------------------------------------------------
; sys_read(char* file_descriptor, char* output_buffer, int size);
;-----------------------------------------------------------------
sys_read:
	push ebp
	mov ebp, esp

	push ebx			; preservo ebx

	mov eax, 3			; para el sys_call
	mov ebx, [esp+8]	; file descriptor
	mov ecx, [esp+12]	; output buffer
	mov edx, [esp+16]	; size to write
	int 80h

	pop ebx

	mov esp, ebp
	pop ebp
	ret	

	


























