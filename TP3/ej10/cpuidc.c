#include <stdio.h>

char* get_cpuid();

int main() {
	char* cpuid = get_cpuid();
	printf("CPUID: %s\n", cpuid);
}
