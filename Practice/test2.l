%{
#include<stdio.h>
%}

%%
("int")|("char")|("float")|("if")|("else") {printf("%s -> is a Keyword",yytext);}

[a-zA-Z_][a-zA-Z0-9_]* {printf("%s -> is a Identifier",yytext);}


("{")|("}") {printf("%s is a Parenthesis ",yytext);}


%%

int yywrap(void){
    return 1;
}

int main(){
    FILE *fp;
    char filename[50];

    printf("Enter Filename: ");
    scanf("%s",filename);

    fp = fopen(filename,"r");
    yyin = fp;

    yylex();
    return 0;
}