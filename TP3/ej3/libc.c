#define STDOUT 1

int sys_write(int fd, void *buffer, int size);

int strlen(const char* str) {
	int i = 0;
	while(*(str+i) != '\0') {
		i++;
	}
	return i;
}

int puts(const char* str) {
	int len = strlen(str);
	return sys_write(STDOUT, (void *) str, len);
}

int main() {
	puts("hbc IOO 0O0 asdG\n");
}
