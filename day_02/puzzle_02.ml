open ContainersLabels

let test_input = "data
usually
looks
like
this" |> String.lines

module A = struct
  let solve input = 0

  let%expect_test _ =
    Printf.printf "%i" (solve test_input);
    [%expect {| 0 |}]
end

module B = struct
  let solve input = 0

  let%expect_test _ =
    Printf.printf "%i" (solve test_input);
    [%expect {| test two oh no |}]
end

let run () =
  let input = Util.read_file "./day_01/input" in

  input |> A.solve |> Printf.printf "A: %i\n";
  input |> B.solve |> Printf.printf "B: %i\n"
