%{#include<stdio.h>

%}

op [+-*\]
letter [a-zA-Z]
digitt [0-9]
id {letter}*|({letter}{digitt})+
notid ({digitt}{letter})+

%%
[A-Z] {printf("%s -> Capital Letter", yytext);}
[0-9] {printf("%s -> Digit", yytext);}
[a-z] {printf("%s -> Small Letter", yytext);}

("int")|("char")|("float")|("if") {printf("%s -> is a keyword \n",yytext);}

{id} {printf("%s -> Idntifire", yytext);}


%%


int yywrap(void){
	return 1;
}

int main(){
	
	FILE *fp;
	char filename[50];
	scanf("%s",filename);
	fp = fopen(filename,"r");
	yyin = fp;
	yylex();
	return 0;
}

