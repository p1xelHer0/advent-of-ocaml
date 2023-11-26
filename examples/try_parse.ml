open ContainersLabels
(* --- Using the `Util.try_parse` function to parse strings "Printf style" --- *)

(* I don't even know if this is a good way to do it but it works for me! *)

(* Take a look at Day 13 from Advent of Code 2021 here:
   https://adventofcode.com/2021/day/13 *)

(* The data we need to parse looks like this: *)
let sample = {|
2,14
8,10
9,0
fold along y=7
fold along x=5
|} |> String.trim

(* Define our types matching the data we need to parse: *)
type fold_type = X of int | Y of int

(* The Instruction is either a Coordinate or a Fold: *)
type instruction = Coordinate of (int * int) | Fold of fold_type

(* The parser will try to use every "Printf style" parser in this list: *)
let parsers =
  Util.
    [
      (* Try to parse it into a Coordinate *)
      parse "%i,%i" (fun x y -> Coordinate (x, y));
      (* Otherwiese: Try to parse into a X Fold *)
      parse "fold along x=%i" (fun x -> Fold (X x));
      (* And lastly: Try to parse into a Y Fold *)
      parse "fold along y=%i" (fun y -> Fold (Y y));
    ]

(* Lastly, use the `try_parse` function with the `parser` to create the parser: *)
let parse_instructions = Util.try_parse parsers

(* This can now be used like so: *)
let instructions =
  let lines = ContainersLabels.String.lines sample in
  List.map ~f:parse_instructions lines
