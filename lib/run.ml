module type Solution_Int = sig
  val solve : string -> int
end

module type Solution_String = sig
  val solve : string -> string
end

let solve_int (module S : Solution_Int) =
  match Sys.argv with
  | [| _; p |] ->
      p |> Util.read_file_as_string |> S.solve |> string_of_int |> print_endline
  | _ -> assert false

let solve_string (module S : Solution_String) =
  match Sys.argv with
  | [| _; p |] -> p |> Util.read_file_as_string |> S.solve |> print_endline
  | _ -> assert false
