open ContainersLabels

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

module A = struct
  let rec solve_aux accu l =
    match l with
    | [] | [ _ ] -> accu
    | x1 :: x2 :: tl ->
        let accu' = if x2 > x1 then succ accu else accu in
        solve_aux accu' (x2 :: tl)

  let solve input =
    let parsed = input |> String.lines |> List.map ~f:int_of_string in
    solve_aux 0 parsed

  let%test "sample data" = Test.(run int (solve sample) ~expect:7)
end

module B = struct
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
    input |> String.lines |> List.map ~f:int_of_string |> solve_aux 0

  let%test "sample data" = Test.(run int (solve sample) ~expect:5)
end

let run_1 () =
  Run.solve_int (module A);
  (* Run.solve_string (module A); *)
  ()

let run_2 () =
  (* Run.solve_int (module B); *)
  (* Run.solve_string (module B); *)
  ()
