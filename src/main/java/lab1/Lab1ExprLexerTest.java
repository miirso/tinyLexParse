package lab1;

import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.Token;
import simpleexpr.SimpleExprLexer;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

/**
 * @Package lab1
 * @Author miirso
 * @Date 2024/11/8 19:28
 */
public class Lab1ExprLexerTest {
    private static final String[] types = {
            null, "INT", "MAIN", "IF", "ELSE", "CONST", "VOID", "WHILE", "BREAK",
            "CONTINUE", "PRINT", "RETURN", "MUL", "DIV", "MOD", "PLUS", "MINUS",
            "ASSIGN", "L_PAREN", "R_PAREN", "L_BRACE", "R_BRACE", "L_BRACKT", "R_BRACKT",
            "EQ", "NEQ", "LT", "GT", "LE", "GE", "NOT", "AND", "OR", "COMMA", "SEMICOLON",
            "WS", "INTEGER_CONST", "IDENT", "LINE_COMMENT", "MULTILINE_COMMENT"
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
            System.out.println(token.getType());
            String type = types[token.getType()];
            String text = token.getText();
            int line = token.getLine();
            System.err.println(type + " " + text + " " + "at Line " + line);
        }
    }
}
