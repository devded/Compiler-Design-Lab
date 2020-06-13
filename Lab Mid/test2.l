%{
	#undef yywrap
	#define yywrap() 1
	int count=0;
%}

op [+-*\]
letter [a-zA-Z]
digitt [0-9]
id {letter}*|({letter}{digitt})+
notid ({digitt}{letter})+

%%
("int")|("char")|("float")|("if") {printf("%S is a keyword \n",yytext);}
%%

int main(){
	FILE *fp;
	char file[10];
	printf("\n Enter File Name: ");
	scanf("%s",file);
	fp = fopen(file,"r");
	yyin = fp;
	yylex();
	return 0;
}