grammar SimpleExpr;

@header{
package simpleexpr;
}

// 冲突匹配解决规则

// 最前优先匹配 关键字 vs 标识符 ML_COMMENT vs DOC_COMMENT
// 最长优先匹配 1.23(1 .23)  >=(> =) ifhappy(if happy)
// 非贪婪匹配


// 程序
prog: stat* EOF ;
    // 一个程序以任意多个语句组成

// 语句
stat: expr ';'
    | ID '=' expr ';'
    | 'print' expr ';' ;
    // 一个语句的结构：
    // 1.表达式加分号结尾
    // 2.标识符=表达式 赋值
    // 3.print 表达式 打印

// 表达式
expr: expr ('*' | '/') expr
    | expr ('+' | '-') expr
    | '('expr')'
    | ID
    | INT
    | FLOAT ;

// 在ID前面ANTLR4自动生成的规则
// PRINT: 'print' ;
// SEMI: ';' ;

SEMI : ';' ;
ASSIGN : '=' ;
PRINT : 'print' ;
MUL : '*' ;
DIV : '/' ;
ADD : '+' ;
SUB : '-' ;
LPAREN : '(' ;
RPAREN : ')' ;

// 标识符
ID : ('_' | LETTER) WORD* ;

// 空白符
WS : [ \t\n\r]+ -> skip;
    // *表示0个或多个 +表示一个以上 空白符需要至少一个
    // skip表示跳过这些字符
    // 空白符的作用是格式化代码、可读性 是无意义的 理所应当的skip

// 整型
INT : '0' | ('+' | '-')? [1-9]NUMBER*
    | ('+' | '-')? [1-9]NUMBER* ('e' | 'E') NUMBER+;
    // 这里的 ? 是重载的 这里表示一个或零个
// 浮点型
FLOAT : INT '.' NUMBER+
      | '.' NUMBER+
      | INT '.' NUMBER+ ('e' | 'E') NUMBER+
      | '.' NUMBER+ ('e' | 'E') NUMBER+ ;

// 单行注释
SL_COMMENT : '//' .*? ('\n' | EOF) -> skip ;
    // ?表示非贪婪匹配 寻找最短结束的\n作为注释的结尾
    // 默认是贪婪匹配 寻找最长结束的\n作为注释的结尾
    // dot . 表示匹配任意单个字符（除了换行符） *是它的量词
SL_COMMENT2 : '//' (~'\n')* '\n' -> skip ;

// 文档注释
DOCS_COMMENT : '/**' .*? ('\n' | EOF) -> skip;
    // 匹配规则之间的顺序
    // 在前部的会优先匹配

// 多行注释
ML_COMMENT : '/*' .*? ('\n' | EOF) -> skip ;

// 语法规则片段
fragment LETTER : [a-zA-Z] ;
fragment NUMBER : [0-9] ;
fragment WORD : '_' | LETTER | NUMBER ;












