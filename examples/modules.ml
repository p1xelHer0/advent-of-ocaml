(* --- Creating your own modules --- *)

(* Advent of Code very often requires some kind of grouping of data.
   While this is pretty easy to achieve with tuples like above I like to create small
   modules. Take a Coordinate module for example: *)
module Coordinate = struct
  (* In OCaml we usually call the type of the module `t`. *)
  type t = { x : int; y : int }

  (* "Constructors" are usually called `make` *)
  let make ~x ~y = { x; y }

  (* Equality and Ordering is usually good for putting this into lists and
     arrays when needing sorting and comparing. *)
  let equal t1 t2 = match t1.x = t2.x with true -> t1.y = t2.y | _ -> false

  (* Ordering *)
  let compare t1 t2 =
    match compare t1.x t2.x with 0 -> compare t1.y t2.y | _ as x -> x

  (* Printing
     We, or I, kinda miss `console.log`, don't we? *)
  let show t = "(" ^ string_of_int t.x ^ ", " ^ string_of_int t.y ^ ")"
end

(* Usage of our Coordinate module *)
let c1 = Coordinate.make ~x:1 ~y:3
let c2 = Coordinate.make ~x:1 ~y:4
let is_eq = Coordinate.equal c1 c2
let cmp = Coordinate.compare c1 c2
let str = Coordinate.show c1

(* Now, lets talk about ppx_deriving a bit *)

(* --- ppx_deriving --- *)
module PPX_Coordinate = struct
  type t = { x : int; y : int }
  [@@deriving show { with_path = false }, eq, ord, make]
  (* The `@@deriving` part is a PPX: https://ocaml.org/docs/metaprogramming *)
end

(* Notice how we still can use these functions... They are generated! *)
let c1 = PPX_Coordinate.make ~x:1 ~y:3
let c2 = PPX_Coordinate.make ~x:1 ~y:4
let is_eq = PPX_Coordinate.equal c1 c2
let cmp = PPX_Coordinate.compare c1 c2
let str = PPX_Coordinate.show c1

(* This can be a time saver when doing something like Advent of Code. I don't know
   how people ACTUALLY use them but in this case it seems neat. *)
