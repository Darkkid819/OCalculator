open Parser
open Eval

let rec repl () =
  print_endline "Enter an expression (or press Ctrl-C to exit):";
  try
    let input = read_line () in
    if String.trim input = "" then
      repl ()
    else
      let tokens = tokenize input in
      let expr, _ = parse_expr tokens in
      let result = eval expr in
      print_result result; 
      repl ()
  with
  | Parser.ParseError msg ->
      Printf.printf "Error: %s\n\n" msg;
      repl ()
  | Failure msg ->
      Printf.printf "Error: %s\n\n" msg;
      repl ()
  | Division_by_zero ->
      Printf.printf "Error: Division by zero\n\n";
      repl ()

let () = repl ()
