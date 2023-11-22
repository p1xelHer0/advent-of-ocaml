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

    OCaml supports multi-line strings by default.
    The identation looks weird because we want to string to look exactly like
    the test data without having to add \n \ by ourselves.
    `String.lines` is added to convert it to a `list` to match our
    `Util.read_file` function. *)
let test_input = "data
usually
looks
like
this" |> String.lines

(* This is how I usually structure this: one for A and one for B. *)
module A = struct
  let solve input = 0

  (* Cram tests, test the output of things.
     I like this because it gives us a nice diff and is easy to implement.

     For more complex comparison I usually use a unit test.
     One can be found in the `util.ml` module. *)
  let%expect_test _ =
    Printf.printf "%i" (solve test_input);
    [%expect {| 0 |}]
end

module B = struct
  let solve input = 0

  let%expect_test _ =
    Printf.printf "%i" (solve test_input);
    [%expect {| 1 |}]
end

(* Print the test and result however you want. *)
let run () =
  let input = Util.read_file "./day_01/input" in

  input |> A.solve |> Printf.printf "A: %i\n";
  input |> B.solve |> Printf.printf "B: %i\n"
