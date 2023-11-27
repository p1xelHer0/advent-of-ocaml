(* Hello, welcome to Advent of Code and OCaml! *)

open ContainersLabels
(* open Containers *)

(* I prefer labeled arguments.

   - This is `fold_left` with labeled argumnets, ~f and ~init are labels.
     `List.fold_left ~f:( + ) ~init:0`
     `List.fold_left ~init:0 ~f:( + )`

   - Labeled arguments also have "punning", meaning that if `f` is defined
     `let f = ( + )`
     then we can omit the `:` part completly
     `List.fold_left ~init:0` ~f`


   - This is `fold_left` without labeled arguments, order matters, like you
     are probably used to
     `List.fold_left ( + ) 0`

   See: https://ocaml.org/docs/labels

   If you don't want this, open Containers instead of ContainersLabels. *)

(* Advent of Code usually provides of with some smaller examples.
   I usually do inline testing to verify that my solution matches the examples.

    OCaml supports multi-line strings by default. *)

(* Paste sample data here *)
let sample = {|
199
200
208
210
200
207
240
269
260
263
|} |> String.trim

(* If some parts of a solution is used in both Part_1 and Part_2 I place the
   outside the modules *)

(* These are my solutions to Day 1 from 2021: https://adventofcode.com/2021/day/1 *)
module Part_1 = struct
  let rec solve_aux accu l =
    match l with
    | [] | [ _ ] -> accu
    | x1 :: x2 :: tl ->
        let accu' = if x2 > x1 then succ accu else accu in
        solve_aux accu' (x2 :: tl)

  (* This needs to be a
     `string -> int`
     or
     `string -> string *)
  let solve input =
    let parsed = input |> String.lines |> List.map ~f:int_of_string in
    solve_aux 0 parsed

  (* According to the description the expected value should be 7 given the
     sample data. *)
  let%test "sample data" = Test.(run int (solve sample) ~expect:7)
end

module Part_2 = struct
  let rec solve_aux accu l =
    match l with
    | x1 :: x2 :: x3 :: x4 :: tl ->
        let sliding_window_1 = Util.sum [ x1; x2; x3 ] in
        let sliding_window_2 = Util.sum [ x2; x3; x4 ] in
        let accu' =
          if sliding_window_2 > sliding_window_1 then succ accu else accu
        in
        solve_aux accu' (x2 :: x3 :: x4 :: tl)
    | _ -> accu

  let solve input =
    (input |> String.lines |> List.map ~f:int_of_string |> solve_aux 0)
    + 1 (* Remove the + 1 part to fix the test below. *)

  (* Set expect result of the sample data here: 5 *)
  let%test "sample data" = Test.(run int (solve sample) ~expect:5)
end

let run_1 () =
  Run.solve_int (module Part_1);
  (* Run.solve_string (module Part_1); *)
  ()

let run_2 () =
  (* When you are done, uncomment this to run the "real thing" *)
  (* Submit the result *)
  (* run `dune promote` *)
  (* Run.solve_int (module Part_2); *)
  (* Run.solve_string (module Part_2); *)
  ()
