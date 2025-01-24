%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "y.tab.h"
%}



%%

"for"                       			{ strcpy(yylval.var, yytext); return FOR; }
"in"			    			{ strcpy(yylval.var, yytext); return IN; }
"if"                        			{ strcpy(yylval.var, yytext); return IF; }
"else"                      			{ strcpy(yylval.var, yytext); return ELSE; }
"elif"                      			{ strcpy(yylval.var, "else if"); return ELIF; }
"range"                      			{ strcpy(yylval.var, yytext); return RANGE; }
"not"                      			{ strcpy(yylval.var, "!"); return NOT; }
"True"                      			{ strcpy(yylval.var, "true"); return TRUE; }
"while"                      			{ strcpy(yylval.var, yytext); return WHILE; }
[a-zA-Z]*                   			{ strcpy(yylval.var, yytext); return LETTER; }
[0-9.]*                      			{ strcpy(yylval.var, yytext); return NUMBER; }
"="                         			{ strcpy(yylval.var, yytext); return EQ; }
"//"                         			{ strcpy(yylval.var, "/"); return FLOORDIV; }
"/"                         			{ strcpy(yylval.var, yytext); return Hterm; }
[<>=!]*                    			{ strcpy(yylval.var, yytext); return COMP; }
[*%]* 			    			{ strcpy(yylval.var, yytext); return Hterm; }
[+-]* 			    			{ strcpy(yylval.var, yytext); return Lterm; }
"("			    			{ strcpy(yylval.var, yytext); return LPAR; }
")"			    			{ strcpy(yylval.var, yytext); return RPAR; }
","			    			{ strcpy(yylval.var, yytext); return COMMA; }
"["			    			{ strcpy(yylval.var, yytext); return LBRACK; }
"]"			    			{ strcpy(yylval.var, yytext); return RBRACK; }
\" 						{ strcpy(yylval.var, yytext); return QUOTE; }
":"			    			{ strcpy(yylval.var, yytext); return COLON; }


[ \t\n]+     
"/*"(.|\n)*?"*/"
%%

int yywrap(void)
{
	return 1;
}