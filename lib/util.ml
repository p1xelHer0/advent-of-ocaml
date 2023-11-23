open ContainersLabels

let read_file name = CCIO.(with_in name read_lines_l)
let read_file_as_string name = CCIO.(with_in name read_all) |> String.trim
let parse fmt map line = try Some (Scanf.sscanf line fmt map) with _ -> None

let rec try_parse parsers line =
  match parsers with
  | [] -> failwith ("could not parse: " ^ line)
  | parse :: parsers -> (
      match parse line with
      | None -> try_parse parsers line
      | Some result -> result)

let remove_duplicates l =
  let cons_uniq tl hd = if Stdlib.List.mem hd tl then tl else hd :: tl in
  List.rev (List.fold_left ~f:cons_uniq ~init:[] l)

let sum = List.fold_left ~f:( + ) ~init:0
let mean l = l |> sum |> fun n -> n / List.length l

let median l =
  l |> List.sort ~cmp:(fun a b -> a - b) |> fun s ->
  List.nth s (List.length s / 2)

let rec insert x l =
  match l with
  | [] -> [ [ x ] ]
  | hd :: tl -> (x :: l) :: List.map ~f:(fun elem -> hd :: elem) (insert x tl)

let array_flatten a = Array.(concat (to_list a))

let rec permutations l =
  match l with
  | [] -> [ l ]
  | hd :: tl -> List.flatten (List.map ~f:(insert hd) (permutations tl))
