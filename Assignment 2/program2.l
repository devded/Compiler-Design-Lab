%{
#include<stdio.h>
%}

op [-\+*]
comma [,]
semicolon [;]
letter [a-zA-Z]
digit [0-9]

id {letter}*|({letter}{digit}*)*
head (#include+["<]([^">]+)*[">])
function ([a-z]+"()")

%%
 /*Header File*/
{head} {printf("%s -> is a Header File \n", yytext);}

 /*Function*/
{function} {printf("%s -> is a Function \n", yytext);}

 /*Keyword*/
("int")|("char")|("float")|("if")|("else")|("return")|("do")|("while")|("void")|("for")|("double")|("break")|("case")|("const")|("continue")|("default")|("goto")|("long")|("register")|("short")|("sizeof")|("static")|("switch")|("union")|("volatile")|("typedef") {printf("%s -> is a keyword \n",yytext);}

 /*Identifier*/
{id} {printf("%s -> is an Idntifire \n", yytext);}

 /*Arithmetic Operator*/
{op} {printf("%s -> is an Arithmetic Operator \n", yytext);}

 /*Assignment Operator*/
("=") {printf("%s -> is a Assign Operator \n", yytext);}

 /*Parenthesis*/
("(")|(")")|("{")|("}")|("[")|("]") {printf("%s -> is a Parenthesis \n", yytext);}

 /*Numeric Value*/
{digit}* {printf("%s -> is a Numeric Value \n", yytext);}

 /*Semicolon*/
{semicolon} {printf("%s -> is a Semicolon \n", yytext);}

 /*Comma*/
{comma} {printf("%s -> is a Comma \n", yytext);}

/*Remove Blank Space*/
[\n\t]+ 
%%




int yywrap(void){
	return 1;
}

int main(){
	printf("Enter Input:  ");
	yylex();
	return 0;
}







