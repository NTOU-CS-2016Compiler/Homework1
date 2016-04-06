%{
#include <stdio.h>
int lineno = 1;
%}
digit		[0-9]
digits		{digit}+
number		[+-]?{digits}(\.{digits})?(E[+-]?{digits})?
letter_		[a-zA-Z_]
identifier	{letter_}({letter_}|{digit})*
literal		(\"[^\"]*\")|(\'[^\']*\')
newline		\n
whitespace	[ \t]+
%%
"auto"			{ printf("AUTO "); }
"double"		{ printf("DOUBLE "); }
"int"				{ printf("INT "); }
"struct"		{ printf("STRUCT "); }
"break"			{ printf("BREAK "); }
"else"			{ printf("ELSE "); }
"long"			{ printf("LONG "); }
"switch"		{ printf("SWITCH "); }
"case"			{ printf("CASE "); }
"enum"			{ printf("ENUM "); }
"register" 	{ printf("REGISTER "); }
"typedef"		{ printf("TYPEDEF "); }
"char"			{ printf("CHAR "); }
"extern"		{ printf("EXTERN "); }
"return"		{ printf("RETURN "); }
"union"			{ printf("UNION "); }
"const"			{ printf("CONST "); }
"float"			{ printf("FLOAT "); }
"short"			{ printf("SHORT "); }
"unsigned" 	{ printf("UNSIGNED "); }
"continue" 	{ printf("CONTINUE "); }
"for"				{ printf("FOR "); }
"signed"		{ printf("SIGNED "); }
"void"			{ printf("VOID "); }
"default"		{ printf("DEFAULT "); }
"goto"			{ printf("GOTO "); }
"sizeof"		{ printf("SIZEOF "); }
"volatile" 	{ printf("VOLATILE "); }
"do"				{ printf("DO "); }
"if"				{ printf("IF "); }
"static"		{ printf("STATIC "); }
"while"			{ printf("WHILE "); }
"..." { printf("[...] "); }
"<=" { printf("[<=] "); }
">=" { printf("[>=] "); }
"+=" { printf("[+=] "); }
"-=" { printf("[-=] "); }
"*=" { printf("[*=] "); }
"/=" { printf("[/=] "); }
"%="	{ printf("[%=] "); }
"!=" { printf("[!=] "); }
"<<" { printf("[<<] "); }
">>" { printf("[>>] "); }
"&&" { printf("[&&] "); }
"++" { printf("[++] "); }
"––" { printf("[--] "); }
"||" {  printf("[||] "); }
"=="	{ printf("[==] "); }
"+"		{ printf("[+] "); }
"-"		{ printf("[-] "); }
"*"		{ printf("[*] "); }
"/"		{ printf("[/] "); }
"!" { printf("[!] "); }
">" { printf("[>] "); }
"<"		{ printf("[<] "); }
"^" { printf("[^] "); }
"&" { printf("[&] "); }
"|" { printf("[|] "); }
"," { printf("[,] "); }
"[" { printf("[[] "); }
"]" { printf("[]] "); }
":" { printf("[:] "); }
"="		{ printf("[=] "); }
"~" { printf("[~] "); }
"%" { printf("[%] "); }
"{"		{ printf("[{] "); }
"}"		{ printf("[}] "); }
"("		{ printf("[(] "); }
")"		{ printf("[)] "); }
";"		{ printf("[;] "); }
"."		{ printf("[.] "); }
"#"    { printf("[#] ");}
{number}	{ printf("NUM:%s ",yytext); }
{identifier}	{ printf("ID:%s ",yytext); }
{literal}	{ printf("STR:%s ",yytext); }
{newline}	{ lineno++; printf("\n "); }
{whitespace}	{ /* skip whitescapes */ }
.		{ printf("<ERROR>"); }
%%

int main() {
	yylex();
	return 0;
}
int yywrap(void)
{return 1;}