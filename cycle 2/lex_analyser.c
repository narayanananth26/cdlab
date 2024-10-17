#include <stdio.h>
#include <ctype.h>
#include <string.h>

void checkKeyword(char buffer[]) {
    char keywords[10][10] = {"int", "return", "if", "else", "while", "for", "do", "break", "continue", "switch"};
    int flag = 0;

    for (int i = 0; i < 10; ++i) {
        if (strcmp(keywords[i], buffer) == 0) {
            printf("%s is a keyword\n", buffer);
            flag = 1;
            break;
        }
    }

    if (flag == 0) {
        printf("%s is an identifier\n", buffer);
    }
}

int main() {
    char ch, buffer[15], operators[] = "+-*/%=";
    FILE *fp;
    int i = 0, j;

    // Open a C source file for reading
    fp = fopen("source.c", "r");

    if (fp == NULL) {
        printf("Error while opening the file\n");
        return 1;
    }

    while ((ch = fgetc(fp)) != EOF) {
        // Check for operators
        for (j = 0; j < 6; ++j) {
            if (ch == operators[j]) {
                printf("%c is an operator\n", ch);
            }
        }

        // Check for identifiers and keywords
        if (isalnum(ch)) {
            buffer[i++] = ch;
        } else if ((ch == ' ' || ch == '\n') && (i != 0)) {
            buffer[i] = '\0';
            i = 0;
            checkKeyword(buffer);
        }
    }

    fclose(fp);
    return 0;
}
