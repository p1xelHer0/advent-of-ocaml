(** [Solution_Int] is a module where the expected result of [solve] is a [int]. *)
module type Solution_Int = sig
  val solve : string -> int
end

(** [Solution_String] is a module where the expected result of [solve] is a
    [string]. *)
module type Solution_String = sig
  val solve : string -> string
end

val solve_int : (module Solution_Int) -> unit
(** [solve_string (module Solution_Int)] run the [Solution_Int] modules
      [solve] function and prints the result to [stdout]. *)

val solve_string : (module Solution_String) -> unit
(** [solve_string (module Solution_String)] run the [Solution_String] modules
      [solve] function and prints the result to [stdout]. *)
