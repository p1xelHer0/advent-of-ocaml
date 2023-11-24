open ContainersLabels

let file_is_not_empty path =
  match Aoc.Util.read_file_as_string path with
  | "" -> false
  | _ -> true
  | exception Sys_error _ -> false

let emoji_for_day day =
  let path i = Printf.sprintf "day_%02d/p%d.expected" day i in
  let result =
    match (file_is_not_empty (path 1), file_is_not_empty (path 2)) with
    | true, false -> "A: Y, B: -"
    | true, true -> "A: Y, B: Y"
    | _ -> "A: -, B: -"
  in
  Printf.sprintf "%i %s" day result

let () =
  List.(1 -- 25 >|= emoji_for_day) |> String.concat ~sep:"\n" |> print_endline
