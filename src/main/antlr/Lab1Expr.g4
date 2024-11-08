grammar Lab1Expr;

// 冲突匹配解决规则

// 最前优先匹配 关键字 vs 标识符 ML_COMMENT vs DOC_COMMENT
// 最长优先匹配 1.23(1 .23)  >=(> =) ifhappy(if happy)
// 非贪婪匹配


// 程序
prog: stat* EOF ;
    // 一个程序以任意多个语句组成

// 语句
stat: INT MAIN L_PAREN R_PAREN L_BRACE stat*? R_BRACE
    | expr ';'                   // 1. 表达式加分号结尾
    | IDENT ASSIGN expr ';'      // 2. 标识符=表达式 赋值
    | PRINT L_PAREN expr R_PAREN ';' // 3. print(表达式) 打印
    | INT IDENT ';'              // 4. 声明 int 变量
    ;

// 表达式
expr: expr ('*' | '/' | '%') expr  // 处理乘除优先级
    | expr ('+' | '-') expr         // 加减优先级
    | '(' expr ')'                  // 括号优先级最高
    | INTEGER_CONST                 // 数字常量
    | IDENT                         // 标识符
    ;

// INT TYPE
INT : 'int' ;

// MAIN
MAIN : 'main' ;

IF : 'if' ;
ELSE : 'else' ;
CONST : 'const' ;
VOID : 'void' ;
WHILE : 'while' ;
BREAK : 'break' ;
CONTINUE : 'continue' ;
PRINT : 'print' ;
RETURN : 'return' ;

MUL : '*' ;
DIV : '/' ;
MOD : '%' ;
PLUS : '+' ;
MINUS : '-' ;
ASSIGN : '=' ;
L_PAREN : '(' ;
R_PAREN : ')' ;
L_BRACE : '{' ;
R_BRACE : '}' ;
L_BRACKT : '[';
R_BRACKT : ']';
EQ : '==' ;
NEQ : '!=' ;
LT : '<' ;
GT : '>' ;
LE : '<=' ;
GE : '>=' ;
NOT : '!' ;
AND : '&&' ;
OR : '||' ;
COMMA : ',' ;
SEMICOLON : ';' ;

// 空白符
WS : [ \t\n\r]+ -> skip ;

// 数字常量，包含十进制数，八进制数，和十六进制数
INTEGER_CONST : '0' [0-7]+               // 八进制
              | ('0x' | '0X') [0-9A-Fa-f]+       // 十六进制
              | [1-9] [0-9]*            // 十进制非零开头
              | '0';                    // 零

// 标识符
IDENT : [a-zA-Z_][a-zA-Z_0-9]*;

// 单行注释
LINE_COMMENT : '//' .*? ('\n' | EOF) -> skip ;

// 多行注释
MULTILINE_COMMENT : '/*' .*? '*/' -> skip ;

// 语法规则片段
fragment LETTER : [a-zA-Z] ;
fragment NUMBER : [0-9] ;
fragment WORD : '_' | LETTER | NUMBER ;
fragment OCT : '0'[0-7]+ ;
fragment HEX : ('0x' | '0X')[0-9A-F]+ ;










