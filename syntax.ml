type t = Zero
       | Succ of t
       | Pred of t
       | IsZero of t

type v = VZero
       | VSucc of v

let rec to_string t = match t with
  | Zero -> "0"
  | Succ(t) -> "succ (" ^ (to_string t) ^ ")"
  | Pred(t) -> "pred (" ^ (to_string t) ^ ")"
  | IsZero(t) -> "iszero (" ^ (to_string t) ^ ")"

