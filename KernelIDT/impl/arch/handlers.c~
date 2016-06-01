
#include "types.h"
#include "klib.h"


void irqDispatcher(dword irq){	
	switch(irq) {
		case 0:
			int_08();
			break;	
	}
	return;
}

static int i = 0;

void int_08(){
	char *video = (char *) 0xb8000;
	video[i++] = (char) i;
}
