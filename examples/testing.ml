(* --- Testing --- *)

(* Feel free to comment these out or remove them to stop them from cluttering up
   your teminal later. *)

(*The `Test.run` function expects 3 values:
   - the type of the expected value
   - the expression we are testing
   - the expected value. *)
let%test "sum" = Test.run Test.int (Util.sum [ 1; 2; 3 ]) ~expect:6

(* We can use a "local open" of the Test module to save some characters *)
let%test "sum open parens" =
  let open Test in
  run int (Util.sum [ 1; 2; 3 ]) ~expect:6

(* Or open it like this with the Module.( ... ) syntax *)
let%test "sum local open" = Test.(run int (Util.sum [ 1; 2; 3 ]) ~expect:6)

(* Showcasing testing a list of lists expect *)
let%test "permutations" =
  Test.(
    run
      (list (list int))
      (Util.permutations [ 1; 2; 3 ])
      ~expect:
        [
          [ 1; 2; 3 ];
          [ 2; 1; 3 ];
          [ 2; 3; 1 ];
          [ 1; 3; 2 ];
          [ 3; 1; 2 ];
          [ 3; 2; 1 ];
        ])
