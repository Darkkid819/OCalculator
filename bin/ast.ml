type expr =
  | Int of int
  | Float of float  
  | Add of expr * expr
  | Sub of expr * expr
  | Mul of expr * expr
  | Div of expr * expr
  | Parens of expr
