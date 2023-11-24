(* Wrapper I use around Alcotest
   See usage in `examples.ml` at comment "Test usage". *)
let run typ received ~expect = Alcotest.check typ "" received expect
let bool = Alcotest.bool
let int = Alcotest.int
let int32 = Alcotest.int32
let int64 = Alcotest.int64
let float = Alcotest.float
let char = Alcotest.char
let string = Alcotest.string
let bytes = Alcotest.bytes
let unit = Alcotest.unit
let list = Alcotest.list
let sorted_list = Alcotest.slist
let array = Alcotest.array
let option = Alcotest.option
let result = Alcotest.result
let pair = Alcotest.pair
let triple = Alcotest.triple
