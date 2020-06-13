%{
#include<stdio.h>
%}

cap [A-Z]
sml [a-z]
letter [A-Za-z]
digit [0-9]

id {letter}({letter}{digit}*)*
%%

[a-zA-Z_][a-zA-Z0-9_]* {printf("%s -> Identifier\n",yytext);}

[0-9]* {printf("%s -> is a Numerical Value\n",yytext);}
[-+*/]  {printf("%s -> is a Operator\n",yytext);}
%%

int yywrap(void){
    return 1;
}

int main(){
    FILE *fp;
    char filename[50];

    printf("Enter Filename:  ");
    scanf("%s",filename);

    fp = fopen(filename,"r");
    yyin = fp;

    yylex();
    return 0;
}