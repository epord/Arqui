#include "kernel.h"
#include "videoDriver.h"
#include "strings.h"
#include "keyboard.h"

/**********************************************
kmain() 
Punto de entrada de c�digo C.
*************************************************/
void kmain() {

	clear();

	while(1) {
		printKey();
		printCursor();		
	}
}


