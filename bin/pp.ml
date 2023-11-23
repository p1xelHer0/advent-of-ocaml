open ContainersLabels

(* This is just a pretty printer that strips some line
   from test test results I consider unneeded. *)
let run () =
  let alcotest_output = CCIO.read_all stdin in
  let filter_lines ~prefixes lines =
    let starts_with_word line =
      not
        (List.exists
           ~f:(fun prefix -> String.starts_with line ~prefix)
           prefixes)
    in
    List.filter ~f:starts_with_word lines
  in
  let prefixes =
    [ "Raised at "; "Called from "; "Logs saved to "; "Full test results in " ]
  in
  let lines = String.lines alcotest_output in
  lines |> filter_lines ~prefixes |> List.iter ~f:(Printf.printf "%s\n")
;;

run ()
