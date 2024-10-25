open Ast

let rec eval = function
  | Int n -> float_of_int n
  | Float f -> f
  | Add (lhs, rhs) -> eval lhs +. eval rhs
  | Sub (lhs, rhs) -> eval lhs -. eval rhs
  | Mul (lhs, rhs) -> eval lhs *. eval rhs
  | Div (lhs, rhs) ->
      let denominator = eval rhs in
      if denominator = 0.0 then raise Division_by_zero
      else eval lhs /. denominator
  | Parens expr -> eval expr

let print_result result =
  let fractional, whole = modf result in
  if fractional = 0.0 then
    Printf.printf "Result: %d\n\n" (int_of_float whole)
  else
    Printf.printf "Result: %.15g\n\n" result
