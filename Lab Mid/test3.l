%{
#undef yywrap
#define yywrap() 1
#include<stdio.h>
  int statements = 0;
  int ids = 0;
  int assign = 0;
  int rel = 0;
  int keywords = 0;
  int integers = 0; 
%}
DIGIT [0-9]
LETTER [A-Za-z]
TYPE int|char|bool|float|void|for|do|while|if|else|return|void
%option yylineno
%option noyywrap

%%
\n {statements++;}
{TYPE} {/*printf("%s\n",yytext);*/keywords++;}
(<|>|<=|>=|==) {rel++;}
'#'/[a-zA-Z0-9]*    {;}
[a-zA-Z]+[a-zA-Z0-9]* {printf("%s\n",yytext);ids++;}
= {assign++;}
[0-9]+ {integers++;}
.      {;}

%%
void main(int argc, char **argv)
{
  FILE *fh;
  if (argc == 2 && (fh = fopen(argv[1], "r"))) {
    yyin = fh;
  }
  yylex();
  printf("statements = %d ids = %d assign = %d rel = %d keywords = %d integers = %d \n",statements,ids,assign,rel,keywords,integers);
}