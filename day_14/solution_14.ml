open ContainersLabels

let sample = {|
...
|} |> String.trim

module Part_1 = struct
  let solve input = 0
  let%test "sample data" = Test.(run int (solve sample) ~expect:0)
end

module Part_2 = struct
  let solve input = 0
  let%test "sample data" = Test.(run int (solve sample) ~expect:0)
end

let run_1 () =
  (* Run.solve_int (module Part_1); *)
  ()

let run_2 () =
  (* Run.solve_int (module Part_2); *)
  ()
