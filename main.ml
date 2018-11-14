let _ =   
  let expr = Parser.value Lexer.token (Lexing.from_channel stdin) in
  let t = Typing.typing expr in
  print_string ((Syntax.to_string expr) ^ ":" ^ (Typing.print_typ t))
