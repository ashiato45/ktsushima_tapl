open Syntax

type typ = Bool | Nat

exception TypeError

(* print_typ: Typing.typ -> string *)
let print_typ typ = match typ with
  | Bool -> "bool"
  | Nat -> "nat"

(* typing: Syntax.t -> Typing.typ *)
let rec typing t = match t with
  | Zero -> Nat(* TODO *)
  | Succ n -> Nat
  | Pred n -> Nat
  | IsZero n -> Bool
  | True -> Bool
  | False -> Bool
  | If (a, b, c) -> 
     match (typing a) with
     | Nat -> raise TypeError
     | Bool -> (
       let typeb = typing b in
       let typec = typing c in
       if typeb = typec then typeb else raise TypeError
     )
