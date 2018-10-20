%{
  let a = 3
%}

%token <int>NUMBER
%token <string>VAR
%token LPAREN
%token RPAREN
%token MINUS
%token PRED
%token SUCC
%token ISZERO
%token ZERO
%token EOF
/* End of File */

/* Type of nonterminal symbol */
%type <Syntax.t> value

%start value

%%

value:
| ZERO {Syntax.Zero}
| SUCC value {Syntax.Succ($2)}
| PRED value {Syntax.Pred($2)}
| ISZERO value {Syntax.IsZero($2)}
| LPAREN value RPAREN {$2}