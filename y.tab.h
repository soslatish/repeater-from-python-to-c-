
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     FOR = 258,
     IF = 259,
     ELSE = 260,
     ELIF = 261,
     LBRACK = 262,
     RBRACK = 263,
     LPAR = 264,
     RPAR = 265,
     COMMA = 266,
     QUOTE = 267,
     COLON = 268,
     IN = 269,
     RANGE = 270,
     NOT = 271,
     TRUE = 272,
     WHILE = 273,
     LETTER = 274,
     Lterm = 275,
     Hterm = 276,
     EQ = 277,
     COMP = 278,
     FLOORDIV = 279,
     NUMBER = 280
   };
#endif
/* Tokens.  */
#define FOR 258
#define IF 259
#define ELSE 260
#define ELIF 261
#define LBRACK 262
#define RBRACK 263
#define LPAR 264
#define RPAR 265
#define COMMA 266
#define QUOTE 267
#define COLON 268
#define IN 269
#define RANGE 270
#define NOT 271
#define TRUE 272
#define WHILE 273
#define LETTER 274
#define Lterm 275
#define Hterm 276
#define EQ 277
#define COMP 278
#define FLOORDIV 279
#define NUMBER 280




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 1676 of yacc.c  */
#line 20 "test.y"

	int number;
	char var[1000];




/* Line 1676 of yacc.c  */
#line 110 "y.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


