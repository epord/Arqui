INC_PATH = include/
DIRECTIVES = -fno-builtin -nostartfiles -nostdlib -I $(INC_PATH)
FLAGS = -g -m32 -c

all:
	nasm -f elf32  -g loader.asm -o loader.o 
	nasm -f elf32  -g RTC.asm -o RTC.o 
	nasm -f elf32  -g keys.asm -o keys.o 

	gcc $(FLAGS) kernel.c -o kernel.o $(DIRECTIVES) 
	gcc $(FLAGS) videoDriver.c -o videoDriver.o $(DIRECTIVES) 
	gcc $(FLAGS) strings.c -o strings.o $(DIRECTIVES) 
	gcc $(FLAGS) keyboard.c -o keyboard.o $(DIRECTIVES) 
	
	ld -melf_i386 -T link.ld -o kernel.bin loader.o kernel.o videoDriver.o strings.o RTC.o keyboard.o keys.o
	rm *.o
	mcopy kernel.bin z:/boot -o

	qemu-system-i386 -fda ../img/disk.img

clean:
	rm *.o
	rm kernel.bin
	
