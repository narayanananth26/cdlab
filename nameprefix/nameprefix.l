%{
#include<stdio.h>
#include<string.h>
int flag=0;
int word_count=0;
char word[50];
%}

%%
[a-zA-Z]+  {
      for(int i=0;i<yyleng-3;i++)
      {
       if (yytext[i]=='A' && yytext[i+1]=='n'&&yytext[i+2]=='a'&&yytext[i+3]=='n')
       {
        flag=1;
        break;
       }
      }
      word_count++;
      strcpy(word,yytext);
     }
     
     
[ \t\n] {
    if (strlen(word)>0 && flag==1)
    {
     printf("%s contains Anan as substring",word);
    }
    else
    {
    printf("%s does not contain Anan as a substring\n", word);
   }
   flag=0;
   strcpy(word,"");
  }
. ;

%%
int yywrap() {
    return 1;
}
void main()
{
 printf("Enter the string\n");
 yylex();
 
 printf("Total number of words :%d\n",word_count);
 
}
    
