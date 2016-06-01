INC_PATH = include/
DIRECTIVES = -fno-builtin -nostartfiles -nostdlib -I $(INC_PATH)
FLAGS = -g -m32 -c

all:
	nasm -f aout -g loader.asm -o loader.o 
	nasm -f aout -g asm/interrupts.asm -o asm_interrupts.o
	nasm -f aout -g arch/keys.asm -o arch_keys.o

	gcc $(FLAGS) arch/handlers.c -o arch_hanlders.o $(DIRECTIVES)
	gcc $(FLAGS) kernel.c -o kernel.o $(DIRECTIVES) 
	gcc $(FLAGS) arch/keyboard.c -o arch_keyboard.o $(DIRECTIVES)
	gcc $(FLAGS) arch/strings.c -o arch_strings.o $(DIRECTIVES)
	gcc $(FLAGS) arch/videoDriver.c -o arch_videoDriver.o $(DIRECTIVES)
	
	ld -melf_i386 -T link.ld -o kernel.bin loader.o kernel.o asm_interrupts.o arch_hanlders.o arch_keys.o 									arch_keyboard.o arch_strings.o arch_videoDriver.o
	rm *.o
	mcopy kernel.bin y:/boot -o
	
	qemu-system-i386 -fda ../img/disk.img
clean:
	rm *.o
	rm kernel.bin
