%{
#include <stdio.h>
#include <ctype.h>

FILE *yyin;  // Declare the input stream
%}

%%

"int"           { printf("Keyword: int\n"); }
"return"        { printf("Keyword: return\n"); }
[a-zA-Z_][a-zA-Z0-9_]* { printf("Identifier: %s\n", yytext); }
[0-9]+          { printf("Number: %s\n", yytext); }
[ \t]+          { /* Ignore whitespaces */ }
.               { printf("Unknown token: %s\n", yytext); }

%%

int main(int argc, char **argv) {
    if (argc > 1) {
        yyin = fopen(argv[1], "r");  // Open the file given as a command-line argument
        if (!yyin) {
            printf("Error opening file.\n");
            return 1;
        }
    }
    yylex();  // Start lexical analysis
    return 0;
}

int yywrap() {
    return 1;
}
