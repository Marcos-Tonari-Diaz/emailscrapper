%{
#include <stdio.h>
%}

PALAVRA1 [[:alnum:]]+[[:alnum:]._-]+[[:alnum:]]+
PALAVRA2 [[:alnum:]]+ 
PALAVRA {PALAVRA1}|{PALAVRA2}
EMAIL {PALAVRA}(@{1}){PALAVRA}
EMAIL_ILEGAL [._-]*{EMAIL}[_-]+|[._-]+{EMAIL}[_-]*

%%

{EMAIL_ILEGAL} ;
{EMAIL} printf("%s\n", yytext);
[^{EMAIL}] ;
[EMAIL] ;

%%

int main() {
  yylex();
  return 0;
}
