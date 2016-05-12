#include "videoDriver.h"
#include "strings.h"

static char *video = (char *) 0xB8000;
const int ROWS = 25;
const int COLS = 80;
static int cursor = 0;


/* print '/0' ended string */
void print(const char* msg, char colourCode) {
	int j = 0;
	for (; msg[j] != '\0' ; cursor++) {
		if (cursor >= ROWS * COLS * 2) {
			cursor = 0;
		}

		video[cursor] = msg[j++];
		video[++cursor] = colourCode;
	}
}

void printNum(int num, int colorCode) {
	char str[10];
	intToString(str, num);
	print(str, colorCode);
}

void printTime() {
	print("Current Time: ", 0x07);

	unsigned int hrs = getHours();
	printNum(hrs, 0x07);
	print(":", 0x07);

	unsigned int min = getMinutes();
	printNum(min, 0x07);
	print(":", 0x07);

	unsigned int sec = getSeconds();
	printNum(sec, 0x07);

	printNewLine();
		
}

void removeCursorMark() {
	video[cursor + 1] = 0x07;
}

void printNewLine() {
	removeCursorMark();
	cursor = ((int)(cursor / (COLS * 2)) + 1) * COLS * 2;	// * 2 because video[]
															// reads char and color
}

void printCursor() {
	video[cursor + 1] = 0x70;
}


void moveCursorUp() {
	removeCursorMark();
	cursor -= COLS * 2;
	cursor = cursor < 0 ? cursor % (COLS*2) + ROWS * COLS * 2: cursor;
}

void moveCursorDown() {
	removeCursorMark();
	cursor += COLS * 2;
	cursor = cursor > ROWS * COLS * 2 ? cursor % (COLS*2) : cursor;
}

void moveCursorLeft() {
	removeCursorMark();
	cursor -= 2;
	cursor = cursor < 0 ? 0: cursor;
}

void moveCursorRight() {
	removeCursorMark();
	cursor += 2;
	cursor = cursor > ROWS * COLS * 2 ? cursor % COLS : cursor;
}

void backspace() {
	removeCursorMark();

	video[cursor - 2] = ' ';
	video[cursor - 1] = 0x00;
	cursor -= 2;
	cursor = cursor < 0 ? 0 : cursor;
}

void supr() {
	removeCursorMark();

	cursor += 2;
	video[cursor] = ' ';
	video[cursor + 1] = 0x00;
}

void printWithLength(const char* msg, int length, char colourCode) {
	int i = cursor;
	int j = 0;
	for (; j < length ; cursor++) {
		video[cursor] = msg[j++];
		video[++cursor] = colourCode;
		if (cursor == ROWS * COLS - 1) {
			cursor = 0;
		}
	}
}

void clear() {
	int i;
	for ( i = 0; i < ROWS * COLS - 1; i++) {
		print(" ", 0x00);
	}
	cursor = 0;
}


