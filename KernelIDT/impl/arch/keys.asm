
GLOBAL read_key

read_key:
	in al, 60h
	movzx eax, al
	ret
