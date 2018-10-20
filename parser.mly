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
%token TRUE
%token FALSE
%token IF
%token THEN
%token ELSE
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
| TRUE {Syntax.True}
| FALSE {Syntax.False}
| IF value THEN value ELSE value {Syntax.If($2, $4, $6)}
| LPAREN value RPAREN {$2}
