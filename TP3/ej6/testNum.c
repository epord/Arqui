
// variables 1: no hace nada (porque???)
//int main() {
//	int numero;
//}

// variables 2: reserva 16 bytes y escribe en los primeros 4
//int main() {
//	int numero = 21;
//}

// variables 3: guarda numero en dataSection (.comm: name, size, alignment)
//int numero;
//int main() {
//	numero = 21;
//}

// varialble 4: declara la variable numero en una zona constante (.data)
//int main() {
//	static int numero = 21;
//}

// variable 5: asigna 10 a una variable numero que no está definida en el .asm (cuando linkedite la va a buscar en otro archivo
//extern numero;
//int main() {
//	numero = 10;
//}

// variable 6: define la variable en .globl con toda su informacion inicial
//int numero = 21;
//int main() {
//	numero = 30;
//}

// variable 7: lo mismo que variable 6
static int numero = 10;
int main() {
	numero = 20;
}
