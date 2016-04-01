%{
#include <stdio.h>
int lineno = 1;
%}
digit		[0-9]
digits		{digit}+
number		[+-]?{digits}(\.{digits})?(E[+-]?{digits})?
letter_		[a-zA-Z_]
identifier	{letter_}({letter_}|{digit})*
literal		\"[^\"]*\"
newline		\n
whitespace	[ \t]+
%%
"int"		{ printf("INT "); }
"if"		{ printf("IF "); }
"do"		{ printf("DO "); }
"while"		{ printf("WHILE "); }
"sizeof"	{ printf("SIZEOF "); }
"else"		{ printf("ELSE "); }
"="		{ printf("ASSIGN "); }
"=="		{ printf("EQ "); }
"<"		{ printf("LT "); }
"+"		{ printf("PLUS "); }
"-"		{ printf("MINUS "); }
"*"		{ printf("MUL "); }
"/"		{ printf("DIV "); }
"{"		{ printf("LCURLYBRACKET "); }
"}"		{ printf("RCURLYBRACKET "); }
"("		{ printf("LPAREN "); }
")"		{ printf("RPAREN "); }
";"		{ printf("SEMI "); }
{number}	{ printf("NUM "); }
{identifier}	{ printf("ID "); }
{literal}	{ printf("LITERAL "); }
{newline}	{ lineno++; printf("\n"); }
{whitespace}	{ /* skip whitescapes */ }
.		{ printf("<ERROR>"); }
%%

int main() {
	yylex();
	return 0;
}
int yywrap(void)
{return 1;}


