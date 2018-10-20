{
open Parser
}

let space = [' ' '\t' '\n' '\r']
let digit = ['0'-'9']
let lower = ['a'-'z']
let upper = ['A'-'Z']
let alpha = lower | upper
let var = lower | upper | digit

rule token = parse
| space+ { token lexbuf }      
| "0"     { ZERO }
| "pred" { PRED }
| "succ" { SUCC }
| "iszero" { ISZERO }
| "true" { TRUE }
| "false" { FALSE }
| "if" { IF }
| "then" { THEN }
| "else" { ELSE }
| "("   { LPAREN }
| ")"   { RPAREN }
| digit+                       
	 { NUMBER (int_of_string (Lexing.lexeme lexbuf)) }
| "-"  { MINUS }
| var +
         { VAR (Lexing.lexeme lexbuf)}
| eof  { EOF }
| _	 { failwith ("unknown token: " ^ Lexing.lexeme lexbuf) }


