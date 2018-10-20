type t = Zero
       | Succ of t
       | Pred of t
       | IsZero of t
       | True
       | False
       | If of t*t*t

type v = VZero
       | VSucc of v

let rec to_string t = match t with
  | Zero -> "0"
  | Succ(t) -> "succ (" ^ (to_string t) ^ ")"
  | Pred(t) -> "pred (" ^ (to_string t) ^ ")"
  | IsZero(t) -> "iszero (" ^ (to_string t) ^ ")"
  | True -> "true"
  | False -> "false"
  | If(t1, t2, t3) -> "If "^(to_string t1)^" then "^(to_string t2)^" else "^(to_string t3)
