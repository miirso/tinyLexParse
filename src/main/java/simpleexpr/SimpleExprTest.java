package simpleexpr;

import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.Token;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;



/**
 * @Package simpleexpr
 * @Author miirso
 * @Date 2024/11/8 13:00
 */
public class SimpleExprTest {
    private static final String[] types = {
            "IF", "ELSE", "CONST", "VOID", "WHILE", "BREAK", "CONTINUE", "PRINT",
            "RETURN", "MUL", "DIV", "MOD", "PLUS", "MINUS", "ASSIGN", "LPAREN", "RPAREN",
            "LBRACE", "RBRACE", "L_BRACKT", "R_BRACKT", "EQ", "NEQ", "LT", "GT",
            "LE", "GE", "NOT", "AND", "OR", "COMMA", "SEMICOLON", "INTEGER_CONST",
            "INT", "IDENT", "WS", "LINE_COMMENT", "MULTILINE_COMMENT", "LETTER",
            "NUMBER", "WORD", "OCT", "HEX"
    };

    public static void main(String[] args) throws IOException {
        InputStream in = System.in;
        String file;
        if (args.length > 0) {
            file = args[0];
            in = new FileInputStream(file);
        }
        CharStream input = CharStreams.fromStream(in);
        SimpleExprLexer lexer = new SimpleExprLexer(input);

        // lexer.getAllTokens().forEach(System.out::println);
        for (Token token : lexer.getAllTokens()) {
            String type = types[token.getType()];
            String text = token.getText();
            int line = token.getLine();
            System.out.println(type + " " + text + " " + "at Line " + line);
        }
    }
}
