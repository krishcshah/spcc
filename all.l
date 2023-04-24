--------------------------------------
LEX
--------------------------------------

LEX Program to check whether input character is vowel or consonants.

%{
#include <stdio.h>
%}

%%
[aeiouAEIOU]  printf("%c is a vowel\n",yytext[0]);   
[bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ] printf("%c is a consonant\n",yytext[0]);
.   printf("%c is an invalid input\n");
%%

int yywrap(){
 return 1;
}
int main() { 
yylex();
return 0;
}

--------------------------------------
--------------------------------------

LEX Program to check whether the string is a word or a number or combination
of both.

%{
	void display(int flag);
%}

%%

[a-zA-Z]+ {
	int flag = 1;
	display(flag);
	return 0;
}

[0-9]+ {
	int flag = 0;
	display(flag);
	return 0;
}

.+ {
	int flag = -1;
	display(flag);
	return 0;
}

%%

#include <stdio.h>

void display(int flag) {
	if(flag == 1) {	
		printf("Word");
	}
	else if(flag == 0) {
		printf("Number");
	}
	else {
		printf("Special charcter");
	}	
}


int yywrap() {}

int main() {
	printf("Enter a character\n");
	yylex();
	return 0;
}

--------------------------------------
--------------------------------------

LEX Program to count the number of lines, words and characters in a text.

%{

// ctrl D for linux, ctrl Z for windows for end of Op

#include <string.h> 
#include <conio.h>
#include <stdio.h>

int lines = 0;
int words = 0;
int characters = 0;

%}

%%
\n      { lines++; }         
[a-zA-Z]+   { words++; characters += strlen(yytext); } 
.       { characters++; }   
%%

int yywrap() {}

int main() {
    yylex();
    printf("Lines: %d\n", lines);
    printf("Words: %d\n", words);
    printf("Characters: %d\n", characters);
    return 0;
}

--------------------------------------
--------------------------------------

LEX Program to implement Lexical Analyzer

%{

char *keywords[] = { "if", "else", "for", "while", "do", "int", "float", "char", "return" }; 

int isKeyword(char *word) {
    int n = sizeof(keywords) / sizeof(keywords[0]);
    for (int i=0; i<n; i++) {
        if (keywords[i] == word) {
           return 1; 
        }
    }
    return 0;
} 

%}

%%

[a-zA-Z][a-zA-Z0-9]* {
    if (isKeyword(yytext)) {
        printf("KEYWORD: %s\n", yytext);
    }
    else {
        printf("IDENTIFIER: %s\n", yytext);
    }
}

[0-9]+ printf("CONSTANT: %s\n", yytext);

\+|\=|\-|\*|\/ printf("OPERATOR: %s\n", yytext);

\(|\)|\{|;|,|\} printf("SEPARATOR: %s\n", yytext);

%%

#include <stdio.h>
#include <conio.h>
#include <string.h>

int yywrap() {}

int main() {
    yylex();
    return 0; 
} 

--------------------------------------
--------------------------------------

LEX Program to accept user name and print message “Hello <user name>”

%{
#include <stdio.h>
%}

%%
[^\n]+ { printf("Hello %s!\n", yytext); }
\n     { /* Ignore newline */ }
%%

int yywrap() {
 return 1;
}
int main(int argc, char *argv[]) {
printf("Enter your name: ");
yylex();
return 0;
}

--------------------------------------
--------------------------------------
--------------------------------------
CODES
--------------------------------------
--------------------------------------
--------------------------------------

LEXICAL ANALYSIS
import re

keyword = ['break','case','char','const','countinue','deafult','do','int','else','enum','extern','float','for','goto','if','long','register','return','short','signed','sizeof','static','switch','typedef','union','unsigned','void','volatile','while']
built_in_functions = ['clrscr()','printf(','scanf(','getch()','main()']
operators = ['+','-','*','/','%','==','!=','>','<','>=','<=','&&','||','!','&','|','^','~','>>','<<','=','+=','-=','*=']
specialsymbol = ['@','#','$','_','!']
separator = [',',':',';','\n','\t','{','}','(',')','[',']']


file = open('test1.txt','r+')
contents = file.read()
splitCode = contents.split() #split program in word based on space
print(splitCode)
length = len(splitCode)      # count the number of word in program
for i in range(0,length):
    if splitCode[i] in keyword:
        print("Keyword -->",splitCode[i])
        continue
    if splitCode[i] in operators:
        print("Operators --> ",splitCode[i])
        continue
    if splitCode[i] in specialsymbol:
        print("Special Operator -->",splitCode[i])
        continue
    if splitCode[i] in built_in_functions:
        print("Built_in Function -->",splitCode[i])
        continue
    if splitCode[i] in separator:
        print("Separator -->",splitCode[i])
        continue
    if re.match(r'(#include*).*', splitCode[i]):
        print ("Header File -->", splitCode[i])
        continue
    if re.match(r'^[-+]?[0-9]+$',splitCode[i]):
        print("Numerals --> ",splitCode[i])
        continue
    if re.match(r"^[^\d\W]\w*\Z", splitCode[i]):
        print("Identifier --> ",splitCode[i])


--------------------------

ALL OTHER CODES

SPCC All Codes:-
 
Lexical Analyser (Python):-
 
keyword = ['break','case','char','const','countinue','deafult','do','int','else','enum','extern','float','for','goto','if','long','register','return','short','signed','sizeof','static','switch','typedef','union','unsigned','void','volatile','while']
built_in_functions = ['clrscr()','printf(','scanf(','getch()','main()']
operators = ['+','-','','/','%','==','!=','>','<','>=','<=','&&','||','!','&','|','^','~','>>','<<','=','+=','-=','=']
specialsymbol = ['@','#','$','_','!']
separator = [',' , ':',';','\n','\t','{','}','(',')','[',']']
 
file=open("input.txt","r+")
filecontent=file.read()
split=filecontent.split()
length=len(split)
 
for i in range(0,length):
    if split[i] in keyword:
        print(split[i],"=keyword")
        continue
    if split[i] in operators:
        print(split[i], "=operator")
        continue
    if split[i] in separator:
        print(split[i], "=seperator")
        continue
    if split[i] in built_in_functions:
        print(split[i],"=built in function")
        continue
    if split[i] in specialsymbol:
        print(split[i],"=Special Symbol")
        continue
    if type(split[i])==int or type(split[i])==float or type(split[i])==complex:
       print(split[i],"=numeral")
       continue
    if split[i].isidentifier():
         print(split[i], "=identifier")
 
Code Optimisation (C):-
 
#include<stdio.h>
#include<string.h>
struct op
{
char l;
char r[20];
}
op[10],pr[10];
int main()
{
int a,i,k,j,n,z=0,m,q;
char *p,*l;
char temp,t;
char *tem;
printf("Enter the Number of Values:");
scanf("%d",&n);
for(i=0;i<n;i++)
{
printf("left: ");
scanf(" %c",&op[i].l);
printf("right: ");
scanf(" %s",&op[i].r);
}
printf("Intermediate Code\n") ;
for(i=0;i<n;i++)
{
printf("%c=",op[i].l);
printf("%s\n",op[i].r);
}
for(i=0;i<n-1;i++)
{
temp=op[i].l;
for(j=0;j<n;j++)
{
p=strchr(op[j].r,temp);
if(p)
{
pr[z].l=op[i].l;
strcpy(pr[z].r,op[i].
r);
z++;
}
}
}
pr[z].l=op[n-1].l;
strcpy(pr[z].r,op[n-1].r);
z++;
 
for(m=0;m<z;m++)
{
tem=pr[m].r;
for(j=m+1;j<z;j++)
{
p=strstr(tem,pr[j].r);
if(p)
{
t=pr[j].l;
pr[j].l=pr[m].l;
for(i=0;i<z;i++)
{
l=strchr(pr[i].r,t) ;
if(l)
{
a=l-pr[i].r;
pr[i].r[a]=pr[m].l;
}}}}}
 
for(i=0;i<z;i++)
{
for(j=i+1;j<z;j++)
{
q=strcmp(pr[i].r,pr[j].r);
if((pr[i].l==pr[j].l)&&!q)
{
pr[i].l='\0';
}
}
}
printf("Optimized Code\n");
for(i=0;i<z;i++)
{
if(pr[i].l!='\0')
{
printf("%c=",pr[i].l);
printf("%s\n",pr[i].r);
}
}
}
 
First (Python):-
 
# function to calculate FIRST set of a given non-terminal
def first(input_grammar, non_terminal, visited):
    # if the non-terminal has already been visited, return the previously calculated FIRST set
    if non_terminal in visited:
        return visited[non_terminal]
 
    # initialize the FIRST set for the non-terminal
    first_set = set()
 
    # iterate over each production rule in the grammar
    for production in input_grammar[non_terminal]:
        # if the production starts with a terminal symbol, add it to the FIRST set
        if production[0] not in input_grammar.keys():
            first_set.add(production[0])
        # if the production starts with a non-terminal symbol, recursively calculate its FIRST set
        else:
            # iterate over the symbols in the production
            for symbol in production:
                # calculate the FIRST set of the non-terminal symbol
                first_of_symbol = first(input_grammar, symbol, visited)
                # add the FIRST set to the FIRST set of the non-terminal
                first_set = first_set.union(first_of_symbol)
                # if the symbol does not derive epsilon, stop iterating
                if 'epsilon' not in first_of_symbol:
                    break
 
    # store the calculated FIRST set in the visited dictionary
    visited[non_terminal] = first_set
 
    return first_set
 
input_grammar = {
    'S': [['A'], ['C', 'd']],
    'A': [['a'], ['$']],
    'B': [['b'], ['$']],
    'C': [['c']]
}
 
# initialize the visited dictionary
visited = {}
 
# calculate the FIRST set of the non-terminal 'S'
first_S = first(input_grammar, 'S', visited)
 
# print the calculated FIRST set
print('FIRST(S) =', first_S)
 
 
Three Address Code (Python):-
 
# Define a counter to keep track of the next available temporary variable
temp_counter = 0
 
# Function to generate a new temporary variable
def new_temp():
    global temp_counter
    temp_counter += 1
    return f"t{temp_counter}"
 
# Function to generate TAC for an arithmetic expression
def gen_tac(expr):
    # Split the expression into tokens
    tokens = expr.split()
 
    # Initialize the result variable to the first operand
    result = tokens[0]
 
    # Loop over the rest of the tokens
    for i in range(1, len(tokens), 2):
        # Generate a new temporary variable
        temp = new_temp()
 
        # Generate TAC for the current operation
        op = tokens[i]
        arg1 = result
        arg2 = tokens[i+1]
		print(temp,"=",arg1," ",op,"  ", arg2)
 
 
# Example usage
expr = "a + b * c - d"
gen_tac(expr)
 
Left Recursion (Python):-
 
def remove_left_recursion(productions, non_terminal):
    # Initialize the new productions list
    new_productions = []
 
    # Get all the productions for the non-terminal
    non_terminal_productions = [p for p in productions if p[0] == non_terminal]
 
    # Get all the productions that don't start with the non-terminal
    other_productions = [p for p in productions if p[0] != non_terminal]
 
    # Check if there is any left recursion for the non-terminal
    has_left_recursion = False
    for production in non_terminal_productions:
        if production[2][0] == non_terminal:
            has_left_recursion = True
            break
 
    if not has_left_recursion:
        # If there is no left recursion, return the original productions list
        return productions
 
    # Otherwise, remove the left recursion
    new_non_terminal = non_terminal + "'"
    for production in non_terminal_productions:
        if production[2][0] == non_terminal:
            # Replace the left recursive production
            new_production = (new_non_terminal, production[2][1:] + (new_non_terminal,))
        else:
            # Add the non-left recursive production
            new_production = (non_terminal, production[2] + (new_non_terminal,))
        new_productions.append(new_production)
 
    # Add the epsilon production
    new_productions.append((new_non_terminal, ('epsilon',)))
 
    # Add the new productions to the other productions list
    for production in other_productions:
        new_productions.append((production[0], production[1] + (new_non_terminal,) if production[0] == non_terminal else production[1]))
 
    # Recursively remove left recursion for the new non-terminal
    new_productions = remove_left_recursion(new_productions, new_non_terminal)
 
    return new_productions
 
 
# Get the grammar from user input
grammar = input("Enter the grammar: ")
 
# Split the grammar into productions
productions = [tuple(p.strip().split(' ')) for p in grammar.split(';')]
 
# Get the starting non-terminal from user input
starting_non_terminal = input("Enter the starting non-terminal: ")
 
# Remove left recursion for the starting non-terminal
productions = remove_left_recursion(productions, starting_non_terminal)
 
# Print the new productions
print("New productions:")
for production in productions:
    print(" ".join(production), end="; ")
 
Left Factoring (Python):-
 
def left_factor(grammar):
    nonterminals = set()
    productions = {}
    for rule in grammar:
        nonterm, prod = rule.split(" -> ")
        nonterminals.add(nonterm)
        if nonterm not in productions:
            productions[nonterm] = []
        productions[nonterm].append(prod)
 
    new_productions = {}
    for nonterm in nonterminals:
        prods = productions[nonterm]
        while len(prods) > 1:
            prefix = os.path.commonprefix(prods)
            if len(prefix) > 0:
                factor = nonterm + "'"
                new_productions[factor] = [prefix]
                for i, prod in enumerate(prods):
                    if prod.startswith(prefix):
                        prods[i] = prod[len(prefix):]
                    else:
                        prods[i] = prod
                new_productions[nonterm] = [factor + " " + prod for prod in prods]
                nonterm = factor
                prods = [new_productions[factor][0]] + prods[1:]
            else:
                break
        new_productions[nonterm] = prods
 
    new_grammar = []
    for nonterm in nonterminals:
        prods = new_productions[nonterm]
        for prod in prods:
            new_grammar.append(nonterm + " -> " + prod)
 
    return new_grammar
 
# Example usage
grammar = ["S -> AB | AC | AD",
           "A -> a | aB",
           "B -> b | bB | bC",
           "C -> c | cD",
           "D -> d"]
new_grammar = left_factor(grammar)
print(new_grammar)
 
LL1 Parser (C):-
 
#include<stdio.h>
#include<string.h>
#define TSIZE 128
int table[100][TSIZE];
char terminal[TSIZE];
char nonterminal[26];
struct product {
    char str[100];
    int len;
}
pro[20];
int no_pro;
char first[26][TSIZE];
char follow[26][TSIZE];
char first_rhs[100][TSIZE];
int isNT(char c) {
    return c >= 'A' && c <= 'Z';
}
void readFromFile() {
    FILE* fptr;
    fptr = fopen("text.txt", "r");
    char buffer[255];
    int i;
    int j;
    while (fgets(buffer, sizeof(buffer), fptr)) {
        printf("%s", buffer);
        j = 0;
        nonterminal[buffer[0] - 'A'] = 1;
        for (i = 0; i < strlen(buffer) - 1; ++i) {
            if (buffer[i] == '|') {
                ++no_pro;
                pro[no_pro - 1].str[j] = '\0';
                pro[no_pro - 1].len = j;
                pro[no_pro].str[0] = pro[no_pro - 1].str[0];
                pro[no_pro].str[1] = pro[no_pro - 1].str[1];
                pro[no_pro].str[2] = pro[no_pro - 1].str[2];
                j = 3;
            }
            else {
                pro[no_pro].str[j] = buffer[i];
                ++j;
                if (!isNT(buffer[i]) && buffer[i] != '-' && buffer[i] != '>') {
                    terminal[buffer[i]] = 1;
                }
            }
        }
        pro[no_pro].len = j;
        ++no_pro;
    }
}
void add_FIRST_A_to_FOLLOW_B(char A, char B) {
    int i;
    for (i = 0; i < TSIZE; ++i) {
        if (i != '^')
            follow[B - 'A'][i] = follow[B - 'A'][i] || first[A - 'A'][i];
    }
}
void add_FOLLOW_A_to_FOLLOW_B(char A, char B) {
    int i;
    for (i = 0; i < TSIZE; ++i) {
        if (i != '^')
            follow[B - 'A'][i] = follow[B - 'A'][i] || follow[A - 'A'][i];
    }
}
void FOLLOW() {
    int t = 0;
    int i, j, k, x;
    while (t++ < no_pro) {
        for (k = 0; k < 26; ++k) {
            if (!nonterminal[k])    continue;
            char nt = k + 'A';
            for (i = 0; i < no_pro; ++i) {
                for (j = 3; j < pro[i].len; ++j) {
                    if (nt == pro[i].str[j]) {
                        for (x = j + 1; x < pro[i].len; ++x) {
                            char sc = pro[i].str[x];
                            if (isNT(sc)) {
                                add_FIRST_A_to_FOLLOW_B(sc, nt);
                                if (first[sc - 'A']['^'])
                                    continue;
                            }
                            else {
                                follow[nt - 'A'][sc] = 1;
                            }
                            break;
                        }
                        if (x == pro[i].len)
                            add_FOLLOW_A_to_FOLLOW_B(pro[i].str[0], nt);
                    }
                }
            }
        }
    }
}
void add_FIRST_A_to_FIRST_B(char A, char B) {
    int i;
    for (i = 0; i < TSIZE; ++i) {
        if (i != '^') {
            first[B - 'A'][i] = first[A - 'A'][i] || first[B - 'A'][i];
        }
    }
}
void FIRST() {
    int i, j;
    int t = 0;
    while (t < no_pro) {
        for (i = 0; i < no_pro; ++i) {
            for (j = 3; j < pro[i].len; ++j) {
                char sc = pro[i].str[j];
                if (isNT(sc)) {
                    add_FIRST_A_to_FIRST_B(sc, pro[i].str[0]);
                    if (first[sc - 'A']['^'])
                        continue;
                }
                else {
                    first[pro[i].str[0] - 'A'][sc] = 1;
                }
                break;
            }
            if (j == pro[i].len)
                first[pro[i].str[0] - 'A']['^'] = 1;
        }
        ++t;
    }
}
void add_FIRST_A_to_FIRST_RHS__B(char A, int B) {
    int i;
    for (i = 0; i < TSIZE; ++i) {
        if (i != '^')
            first_rhs[B][i] = first[A - 'A'][i] || first_rhs[B][i];
    }
}
// Calculates FIRST(ß) for each A->ß
void FIRST_RHS() {
    int i, j;
    int t = 0;
    while (t < no_pro) {
        for (i = 0; i < no_pro; ++i) {
            for (j = 3; j < pro[i].len; ++j) {
                char sc = pro[i].str[j];
                if (isNT(sc)) {
                    add_FIRST_A_to_FIRST_RHS__B(sc, i);
                    if (first[sc - 'A']['^'])
                        continue;
                }
                else {
                    first_rhs[i][sc] = 1;
                }
                break;
            }
            if (j == pro[i].len)
                first_rhs[i]['^'] = 1;
        }
        ++t;
    }
}
int main() {
    readFromFile();
    follow[pro[0].str[0] - 'A']['$'] = 1;
    FIRST();
    FOLLOW();
    FIRST_RHS();
    int i, j, k;
 
    // display first of each variable
    printf("\n");
    for (i = 0; i < no_pro; ++i) {
        if (i == 0 || (pro[i - 1].str[0] != pro[i].str[0])) {
            char c = pro[i].str[0];
            printf("FIRST OF %c: ", c);
            for (j = 0; j < TSIZE; ++j) {
                if (first[c - 'A'][j]) {
                    printf("%c ", j);
                }
            }
            printf("\n");
        }
    }
 
    printf("\n");
    for (i = 0; i < no_pro; ++i) {
        if (i == 0 || (pro[i - 1].str[0] != pro[i].str[0])) {
            char c = pro[i].str[0];
            printf("FOLLOW OF %c: ", c);
            for (j = 0; j < TSIZE; ++j) {
                if (follow[c - 'A'][j]) {
                    printf("%c ", j);
                }
            }
            printf("\n");
        }
    }
    printf("\n");
    for (i = 0; i < no_pro; ++i) {
        printf("FIRST OF %s: ", pro[i].str);
        for (j = 0; j < TSIZE; ++j) {
            if (first_rhs[i][j]) {
                printf("%c ", j);
            }
        }
        printf("\n");
    }
 
 
    terminal['$'] = 1;
 
 
    terminal['^'] = 0;
 
    // printing parse table
    printf("\n");
    printf("\n\t**************** LL(1) PARSING TABLE *******************\n");
    printf("\t--------------------------------------------------------\n");
    printf("%-10s", "");
    for (i = 0; i < TSIZE; ++i) {
        if (terminal[i])    printf("%-10c", i);
    }
    printf("\n");
    int p = 0;
    for (i = 0; i < no_pro; ++i) {
        if (i != 0 && (pro[i].str[0] != pro[i - 1].str[0]))
            p = p + 1;
        for (j = 0; j < TSIZE; ++j) {
            if (first_rhs[i][j] && j != '^') {
                table[p][j] = i + 1;
            }
            else if (first_rhs[i]['^']) {
                for (k = 0; k < TSIZE; ++k) {
                    if (follow[pro[i].str[0] - 'A'][k]) {
                        table[p][k] = i + 1;
                    }
                }
            }
        }
    }
    k = 0;
    for (i = 0; i < no_pro; ++i) {
        if (i == 0 || (pro[i - 1].str[0] != pro[i].str[0])) {
            printf("%-10c", pro[i].str[0]);
            for (j = 0; j < TSIZE; ++j) {
                if (table[k][j]) {
                    printf("%-10s", pro[table[k][j] - 1].str);
                }
                else if (terminal[j]) {
                    printf("%-10s", "");
                }
            }
            ++k;
            printf("\n");
        }
    }
}
 
Follow (C):-
 
#include<stdio.h>
#include<string.h>
int n,m=0,p,i=0,j=0;
char a[10][10],followResult[10];
void follow(char c);
void first(char c);
void addToResult(char);
int main()
{
 int i;
 int choice;
 char c,ch;
 printf("Enter the no.of productions: ");
scanf("%d", &n);
 printf(" Enter %d productions\nProduction with multiple terms should be give as separate productions \n", n);
 for(i=0;i<n;i++)
  scanf("%s%c",a[i],&ch);
    // gets(a[i]);
 do
 {
  m=0;
  printf("Find FOLLOW of -->");
  scanf(" %c",&c);
  follow(c);
  printf("FOLLOW(%c) = { ",c);
  for(i=0;i<m;i++)
   printf("%c ",followResult[i]);
  printf(" }\n");
  printf("Do you want to continue(Press 1 to continue....)?");
 scanf("%d%c",&choice,&ch);
 }
 while(choice==1);
}
void follow(char c)
{
    if(a[0][0]==c)addToResult('$');
 for(i=0;i<n;i++)
 {
  for(j=2;j<strlen(a[i]);j++)
  {
   if(a[i][j]==c)
   {
    if(a[i][j+1]!='\0')first(a[i][j+1]);
    if(a[i][j+1]=='\0'&&c!=a[i][0])
     follow(a[i][0]);
   }
  }
 }
}
void first(char c)
{
      int k;
                 if(!(isupper(c)))
                     //f[m++]=c;
                     addToResult(c);
                 for(k=0;k<n;k++)
                 {
                 if(a[k][0]==c)
                 {
                 if(a[k][2]=='$') follow(a[i][0]);
                 else if(islower(a[k][2]))
                     //f[m++]=a[k][2];
                     addToResult(a[k][2]);
                 else first(a[k][2]);
                 }
                 }
}
void  addToResult(char c)
{
    int i;
    for( i=0;i<=m;i++)
        if(followResult[i]==c)
            return;
   followResult[m++]=c;
}
 
Follow (C++):-
 
#include <iostream>
#include <map>
#include <algorithm>
#include <string>
#include <vector>
#include <set>
 
using namespace std;
 
map<char,vector<string> > prod_rules;
map<char,vector<char> > first_ans;
map<char,set<char> > follow_ans;
set<char> done;
 
void findfollow(char nt)
{
    // cout<<"\nnt : "<<nt<<endl;
    if(done.find(nt)!=done.end()) return;
    for(auto i=prod_rules.begin();i!=prod_rules.end();i++)
    {
        char fnt = i->first;
        // cout<<"fnt : "<<fnt<<endl;
        vector<string> rules = i->second;
 
        for(int j=0;j<rules.size();j++)
        {
            string rule = rules[j];
            // cout<<"rule : "<<rule<<endl;
            int flag = 0;
            int k;
            for(k = 0;k<rule.length();k++)
            {
                // cout<<rule[k]<<",";
                if(rule[k]==nt) flag=1;
                else if(flag==1)
                {
                    if(!isupper(rule[k]))
                    {
                        follow_ans[nt].insert(rule[k]);
                        flag=0;
                    } 
                    vector<char> first = first_ans[rule[k]];
                    int flag2 = 0;
                    for(int p=0;p<first.size();p++)
                    {
                        if(first[p]!='#') follow_ans[nt].insert(first[p]);
                        else flag2=1;
                    }
                    if(flag2==0) flag=0;
                }
            }
            // cout<<endl;
            if(k==rule.length() && flag==1 && fnt!=nt)
            {
 
                if(done.find(fnt)==done.end()) findfollow(fnt);
                set<char> follow = follow_ans[fnt];
                for(auto p:follow) follow_ans[nt].insert(p);
            } 
        }
    }
    done.insert(nt);
 
}
 
int main()
{
    prod_rules['E'].push_back("TR");
    prod_rules['R'].push_back("+TR");
    prod_rules['R'].push_back("#");
    prod_rules['T'].push_back("FY");
    prod_rules['Y'].push_back("*FY");
    prod_rules['Y'].push_back("#");
    prod_rules['F'].push_back("(E)");
    prod_rules['F'].push_back("i");
 
    first_ans['E'].push_back('(');
    first_ans['E'].push_back('i');
    first_ans['R'].push_back('+');
    first_ans['R'].push_back('#');
    first_ans['T'].push_back('(');
    first_ans['T'].push_back('i');
    first_ans['Y'].push_back('#');
    first_ans['Y'].push_back('*');
    first_ans['F'].push_back('(');
    first_ans['F'].push_back('i');
 
    follow_ans['E'].insert('$');
 
    for(auto i : prod_rules) findfollow(i.first);
 
    cout<<"\n\n** Follow of Non terminals **\n\n"<<endl;
    for (auto i : follow_ans)
    {
        cout << i.first << "->";
        for (auto j : i.second)
        {
            cout << j << ',';
        }
        cout << endl;
    }
 
    return 0;
}
 
Macro Pass 1 (Python):-
 
import re
 
macro_defs = {}
labels = {}
output = []
 
def add_label(name):
    if name not in labels:
        labels[name] = len(labels)
 
def replace_macro_invocation(line):
    parts = line.strip().split()
    if parts and parts[0] in macro_defs:
        macro_name = parts[0]
        macro_args = parts[1:]
        macro_label = labels[macro_name]
        return f'L{macro_label} {macro_name} {" ".join(macro_args)}'
    else:
        return line.strip()
 
def process_line(line):
    if re.match(r'\s*MACRO\s+', line):
        parts = line.strip().split()
        macro_name = parts[1]
        macro_args = parts[2:]
        macro_defs[macro_name] = macro_args
        add_label(macro_name)
    else:
        output.append(replace_macro_invocation(line))
 
with open('input.asm') as f:
    for line in f:
        process_line(line)
 
with open('output.asm', 'w') as f:
    for i, line in enumerate(output):
        f.write(f'L{i} {line}\n')
