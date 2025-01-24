%{
    #include<stdio.h>
    #include<stdlib.h>
    #include<string.h>
    #include<ctype.h>

    extern FILE *yyin;
    extern FILE *yyout;

    extern int yylex();
    void yyerror (char *s) 
    {
        printf ("%s\n", s);
    }

%}


%union
{
	int number;
	char var[1000];

}


%token <var> FOR IF ELSE ELIF LBRACK RBRACK LPAR RPAR COMMA QUOTE COLON IN RANGE NOT TRUE WHILE
%token <var> LETTER Lterm Hterm EQ COMP FLOORDIV
%token <var> NUMBER


%type <var> START CODE ARRAY ID TEXT NUMBERS INITING INITS EXPR FCYCLE FOROPS CONDITION COMPARE CONDITIONS WCYCLE
%type <var> LOOPS


%start START

%%

START: CODE	{ fprintf(yyout, "%s", $$); }
;

CODE: INITS LOOPS EXPR CONDITIONS EXPR EXPR
	{ strcpy($$, "#include<iostream>\n#include<string>\n\nint main(){\n"); 
	strcat($$, $1); strcat($$, "\n"); 
	strcat($$, $2); 
	strcat($$, $3); strcat($$, "\n");
	strcat($$, $4); strcat($$, "\n");
	strcat($$, $5); strcat($$, $6);
	strcat($$, "\nreturn 0;\n}"); };

LOOPS: FCYCLE { strcpy($$, $1); }
    | FCYCLE LOOPS { strcpy($$, $1); strcat($$, "\n"); strcat($$, $2); strcat($$, "\n"); }
    | WCYCLE { strcpy($$, $1); }
;

CONDITIONS:
	CONDITION CONDITION CONDITION CONDITION
	{ strcpy($$, $1); strcat($$, "\n");  strcat($$, $2); strcat($$, "\n"); strcat($$, $3); strcat($$, "\n"); 
	strcat($$, $4); }
;

INITS: INITING { strcpy($$, $1); }
	|INITING INITS {strcpy($$, $1); strcat($$, $2);}
;

INITING: 
	ID EQ NUMBER 		
	{
		strcpy($$, "int "); strcat($$, $1); strcat($$, $2); strcat($$, $3); strcat($$, ";\n ");
	}

	|ID EQ TRUE 		
	{
		strcpy($$, "bool "); strcat($$, $1); strcat($$, $2); strcat($$, $3); strcat($$, ";\n ");
	}

	|ID EQ TEXT 		
	{
		strcpy($$, "std::string "); strcat($$, $1); strcat($$, $2); strcat($$, $3); strcat($$, ";\n ");
	}

	|ID EQ ARRAY 		
	{
		strcpy($$, "int "); strcat($$, $1); strcat($$, "[]"); strcat($$, $2); strcat($$, $3); strcat($$, ";\n ");
	}
;

ID: 
	LETTER			
	{strcpy($$, $1);}
;

TEXT: 
	QUOTE LETTER QUOTE 
	{ strcpy($$,$1); strcat($$, $2); strcat($$, $3);}
;

ARRAY: 
	LBRACK NUMBERS RBRACK { strcpy($$,$1); strcat($$, $2); strcat($$, $3);}
;

NUMBERS: NUMBER { strcpy($$, $1); }
	|NUMBER COMMA NUMBERS {strcpy($$, $1); strcat($$, $2); strcat($$, $3);}
;


EXPR: 
	ID EQ ID Lterm ID 
	{ strcpy($$,$1); strcat($$, $2); strcat($$, $3); strcat($$, $4); strcat($$, $5); strcat($$, ";\n"); }
 
	|ID EQ ID Hterm NUMBER
	{ strcpy($$,$1); strcat($$, $2); strcat($$, $3); strcat($$, $4); strcat($$, $5); strcat($$, ";\n"); }

	|ID EQ ID FLOORDIV NUMBER
	{ strcpy($$,$1); strcat($$, $2); strcat($$, "(int)("); strcat($$, $3); strcat($$, $4); strcat($$, $5); 
	strcat($$, ");\n"); }

	|ID EQ ID Lterm NUMBER
	{ strcpy($$,$1); strcat($$, $2); strcat($$, $3); strcat($$, $4); strcat($$, $5); strcat($$, ";\n"); }

	|ID EQ NUMBER
	{ strcpy($$,$1); strcat($$, $2); strcat($$, $3); strcat($$, ";\n");}

;

FCYCLE:
	 FOR ID IN RANGE LPAR NUMBER RPAR COLON FOROPS
	{ strcpy($$, $1); strcat($$, "(int "); strcat($$, $2); strcat($$, "=0; "); strcat($$, $2); strcat($$, "<"); 
	strcat($$, $6); strcat($$, "; "); strcat($$, $2); strcat($$, "++)\n{\n"); strcat($$, $9); strcat($$, "}\n");}
;

FOROPS: 
	ID LBRACK ID RBRACK Lterm EQ ID
	{ strcpy($$,"\t"); strcat($$, $1); strcat($$, $2); strcat($$, $3); strcat($$, $4); strcat($$, $5); strcat($$, $6); 	strcat($$, $7); strcat($$, ";\n");}

	|EXPR EXPR EXPR EXPR
	{ strcpy($$, "\t"); strcat($$, $1); strcat($$, "\t"); strcat($$, $2); strcat($$, "\t"); strcat($$, $3); 
	strcat($$, "\t"); strcat($$, $4);}

	|ID EQ NOT ID IF COMPARE COLON EXPR ELSE COLON EXPR 
	{ strcpy($$, "\t"); strcat($$, $1); strcat($$, $2); strcat($$, $3); strcat($$, $4); strcat($$, ";\n");
	strcat($$, "\t"); strcat($$, $5); strcat($$, "("); strcat($$, $6); strcat($$, ")\n\t{\n"); strcat($$, "\t\t"); 	strcat($$, $8); strcat($$, "\t}\n"); strcat($$, "\t"); strcat($$, $9); strcat($$, "\n\t{\n"); strcat($$, "\t\t"); 	strcat($$, $11); strcat($$, "\t}\n");}
;


WCYCLE:
	WHILE COMPARE COLON EXPR
	{strcpy($$, $1); strcat($$, "("); strcat($$, $2); strcat($$, ")\n{\n\t"); strcat($$, $4); strcat($$, "}"); }
;

CONDITION: 
	IF COMPARE COLON EXPR 
	{ strcpy($$,$1); strcat($$, "("); strcat($$, $2); strcat($$, ")\n{\n\t"); strcat($$, $4); strcat($$, "}\n"); }

	|ELSE COLON EXPR
	{ strcpy($$,$1); strcat($$, "\n{\n\t"); strcat($$, $3); strcat($$, "}\n");}

	|ELIF COMPARE COLON EXPR 
	{ strcpy($$,$1); strcat($$, "("); strcat($$, $2); strcat($$, ")\n{\n\t"); strcat($$, $4); strcat($$, "}\n"); }
;


COMPARE: 
	ID COMP NUMBER 
	{ strcpy($$, $1); strcat($$, $2); strcat($$, $3); }

	|ID 
	{ strcpy($$, $1); }
;

%%

int main(int argc,char **argv){
    
	yyin = fopen("test.txt","rt");
	yyout=fopen("test.cpp", "w");
	
	yyparse();
    
	fclose(yyin);
	fclose(yyout);
	

	printf("Programm ended");

	return 0;
    
}