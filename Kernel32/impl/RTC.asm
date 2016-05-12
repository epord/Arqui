GLOBAL getSeconds
GLOBAL getMinutes
GLOBAL getHours
GLOBAL getDayOfWeek
GLOBAL getMonth
GLOBAL getYear

getSeconds:
	mov al, 0x00
	call readRTC
	ret

getMinutes:
	mov al, 0x02
	call readRTC
	ret

getHours:
	mov al, 0x04
	call readRTC
	ret

getDayOfWeek:
	mov al, 0x06
	call readRTC
	ret

getMonth:
	mov al, 0x08
	call readRTC
	ret

getYear:
	mov al, 0x09
	call readRTC
	ret

readRTC:
	out 0x70, al
	in al, 0x71
	movzx eax, al

	; PORQUE ESTE BLOQUE???
	mov cl, 16
	div cl
	mov ch, ah
	mov cl, 10
	mul cl
	add al, ch
	movzx eax, al

	ret

