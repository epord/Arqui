#include <stdio.h>

int fibonacci_c(int);
int fibonacci_asm(int);

int main() {
	int x = 8;
	int fibo = fibonacci_c(x);
	//int fibo = fibonacci_asm(8);
	printf("fib(%d) = %d\n", x, fibo);
}

int fibonacciRec(int a, int b, int cant) {
	if (cant == 0) {
		return a;	
	}
	return fibonacciRec(b, a+b, cant-1);
}

int fibonacci_c(int i) {
	return fibonacciRec(1, 1, i);
}
