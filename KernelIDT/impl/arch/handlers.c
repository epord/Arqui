
#include "types.h"
#include "klib.h"
#include "videoDriver.h"
#include "keyboard.h"


void int_09();

static char *video = (char *) 0xb8000;

void irqDispatcher(dword irq){	
	switch(irq) {
		case 0:
			//int_08();
			break;
		case 1:
			int_09();
			break;
	}
	return;
}

static int counter = 0;
static int i = 0;
static char ascii = '0';

void int_08(){
	if (counter++ == 18*2) {	// 2 sec transcurred
		counter = 0;
		video[i++] = ascii++;
		video[i++] = (char) 0x25;
	}
}

void int_09() {
	printKey();
	//char key = read_key();
	//printNum(key, 0x07);
}
