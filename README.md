ОБЩЕЕ

Пересборка этой жести:
  bison -dv -y test.y 
  flex test.l
  gcc lex.yy.c y.tab.c -o <название исполняемого файла>

