open Ast

exception ParseError of string

let is_digit_or_dot c =
  let code = Char.code c in
  (code >= Char.code '0' && code <= Char.code '9') || c = '.'

let tokenize input =
  let rec aux i tokens =
    if i >= String.length input then List.rev tokens
    else
      let c = input.[i] in
      if c = ' ' then aux (i + 1) tokens
      else if List.mem c ['+'; '-'; '*'; '/'; '('; ')'] then
        aux (i + 1) (String.make 1 c :: tokens)
      else if is_digit_or_dot c then
        let j = ref i in
        while !j < String.length input && is_digit_or_dot input.[!j] do
          incr j
        done;
        let number = String.sub input i (!j - i) in
        aux !j (number :: tokens)
      else
        raise (ParseError ("Unexpected character: " ^ String.make 1 c))
  in
  aux 0 []

let rec parse_expr tokens =
  let lhs, remaining = parse_term tokens in
  parse_add_sub lhs remaining

and parse_add_sub lhs tokens =
  match tokens with
  | "+" :: rest ->
      let rhs, remaining = parse_term rest in
      parse_add_sub (Add (lhs, rhs)) remaining
  | "-" :: rest ->
      let rhs, remaining = parse_term rest in
      parse_add_sub (Sub (lhs, rhs)) remaining
  | _ -> (lhs, tokens)

and parse_term tokens =
  let lhs, remaining = parse_factor tokens in
  parse_mul_div lhs remaining

and parse_mul_div lhs tokens =
  match tokens with
  | "*" :: rest ->
      let rhs, remaining = parse_factor rest in
      parse_mul_div (Mul (lhs, rhs)) remaining
  | "/" :: rest ->
      let rhs, remaining = parse_factor rest in
      parse_mul_div (Div (lhs, rhs)) remaining
  | _ -> (lhs, tokens)

and parse_factor tokens =
  match tokens with
  | "(" :: rest ->
      let expr, remaining = parse_expr rest in
      (match remaining with
       | ")" :: tail -> (Parens expr, tail)
       | _ -> raise (ParseError "Expected closing parenthesis"))
  | number :: rest when String.contains number '.' ->
      (Float (float_of_string number), rest)
  | number :: rest when String.for_all is_digit_or_dot number ->
      (Int (int_of_string number), rest)
  | _ -> raise (ParseError "Invalid expression")

