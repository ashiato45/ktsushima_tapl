let _ =   
  let expr = Parser.value Lexer.token (Lexing.from_channel stdin) in
  print_string (Syntax.to_string expr)
