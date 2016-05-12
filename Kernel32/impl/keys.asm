; info: www.phatcode.net/res/223/files/html/Chapter_20/CH20-2.html

GLOBAL readKey
GLOBAL isKeyPressed


readKey:
	in al, 64h		; read keyboard status register
	and al, 01h
	cmp al, 01h		; is there any key pressed?
	jz ready
	jmp readKey
ready:
	in al, 60h
	movzx eax, al
	ret

isKeyPressed:
	in al, 60h
	and al, 01h
	jz pressed
	mov eax, 0
pressed:
	mov eax, 1
	ret
