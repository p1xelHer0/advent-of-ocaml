open ContainersLabels

let run =
  let test_output = CCIO.read_all stdin in

  let is_not_blankline s = String.(not (s = "")) in

  test_output |> String.lines |> List.iter ~f:(Printf.printf "%s\n")
