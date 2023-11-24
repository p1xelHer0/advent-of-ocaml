(* Testing *)

(*The `Test.run` function expects 3 values:
   - the type of the expected value
   - the expression we are testing
   - the expected value. *)
let%test "sum" = Test.run Test.int (Util.sum [ 1; 2; 3 ]) ~expect:6

(* We can use a "local open" of the Test module to save some characters *)
let%test "sum open parens" =
  let open Test in
  run int (Util.sum [ 1; 2; 3 ]) ~expect:6

(* Or open it like this with the Module.( ... ) syntax *)
let%test "sum local open" = Test.(run int (Util.sum [ 1; 2; 3 ]) ~expect:6)

(* Showcasing testing a list of lists expect *)
let%test "permutations" =
  Test.(
    run
      (list (list int))
      (Util.permutations [ 1; 2; 3 ])
      ~expect:
        [
          [ 1; 2; 3 ];
          [ 2; 1; 3 ];
          [ 2; 3; 1 ];
          [ 1; 3; 2 ];
          [ 3; 1; 2 ];
          [ 3; 2; 1 ];
        ])

(* ----- *)

(* Creating your own modules *)

(* Advent of Code very often requires some kind of grouping of data.
   While this is pretty easy to achieve with tuples I like to create small
   modules. Take a Coordinate module for example: *)
module Coordinate = struct
  (* In OCaml we usually call the type of the module `t`. *)
  type t = { x : int; y : int; value : int }
  [@@deriving show { with_path = false }, eq]
  (* The `deriving` part is a ppx: https://ocaml.org/docs/metaprogramming *)

  (* "Constructors" are usually called `make` *)
  let make ~x ~y ~value = { x; y; value }

  (* Equality and Ordering is usually good for putting this into lists and arrays *)
  let eq t1 t2 = match t1.x = t2.x with true -> t1.y = t2.y | _ -> false

  (* Ordering *)
  let compare t1 t2 =
    match compare t1.x t2.x with 0 -> compare t1.y t2.y | _ as x -> x

  (* Printing *)
  let show t =
    "((" ^ string_of_int t.x ^ ", " ^ string_of_int t.y ^ "): "
    ^ string_of_int t.value ^ ")"
end

let c1 = Coordinate.make ~x:1 ~y:3
let c2 = Coordinate.make ~x:1 ~y:4
