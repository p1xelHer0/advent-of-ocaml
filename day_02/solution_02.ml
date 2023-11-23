open ContainersLabels

let example_input = "data
usually
looks
like
this" |> String.lines

module A = struct
  (* ... *)

  let solve input = 0

  (* ... *)
  let%test "A: match test input" = Test.run Test.int (solve example_input) 0
end

module B = struct
  (* ... *)

  let solve input = 1

  (* ... *)

  let%test "B: match test input" = Test.run Test.int (solve example_input) 1
end

let run () =
  let input = Util.read_file "./day_02/input" in
  let a = A.solve input in
  let b = B.solve input in

  Printf.printf "A: %i\n" a;
  Printf.printf "B: %i\n" b
