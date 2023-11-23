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

   If you don't want this, open Containers instead of ContainersLabels at the
   top of the file! *)

(* Advent of Code usually provides of with some smaller examples.
   I usually do inline testing to verify that my solution matches the examples.

   OCaml supports multi-line strings by default.
   The identation looks weird because we want to string to look exactly like
   the test data without having to add \n \ by ourselves.
   `String.lines` is added to convert it to a `list` to match our
   `Util.read_file` function. *)
let sample = {|
12
42
11
3
|} |> String.trim |> String.lines

(* This is how I usually structure this: one for A and one for B. *)
module A = struct
  let solve input = List.hd input |> int_of_string

  (* This is a inline test which I use as a sanity check to
     verify the example data that is usually provided for each day:

     `Test.run runs a test, the text expects three things:
     - the type of the things we are comparing in the test
     - the first value or expression
     - the second value or expression which we compare to the first one. `*)
  let%test "A: sample test" = Test.run Test.int (solve sample) 0
end

module B = struct
  (* ... *)

  let solve input = 0

  (* ... *)

  let%test "B: sample test" = Test.run Test.int (solve sample) 1
end

(* Print the test and result however you want. *)
let run () =
  let input = Util.read_file "./day_01/input" in
  let a = A.solve input in
  let b = B.solve input in

  Printf.printf "A: %i\n" a;
  Printf.printf "B: %i\n" b
