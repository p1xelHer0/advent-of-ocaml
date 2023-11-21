(lang dune 3.11)

; dune-project is the configuration file for the project

(name aoc)

; Let Dune generate our `aoc.opam` file to let
; opam know what what packages to install in our switch.

(generate_opam_files true)

; You can do this!

(authors "You")

(maintainers "You")

(homepage "https://adventofcode.com")

; Look out for other communities to talk about Advent of Code.
; Perhaps your favorite streamer or a community forum you are a part of are
; doing it as well! Some Discord channels have a dedicated #advent-of-code
; channel.

(bug_reports "https://www.reddit.com/r/adventofcode/")

; Do whatever you want, fork it, clone it, remove the `.git` folder

(license WTFPL)

(package
 (name aoc)
 (synopsis "Advent of Code in OCaml")
 (description
  "This repository contains a boilerplate project to solve Advent of Code.")
 (depends
  ; Compiler version
  (ocaml
   (= 5.1.0))
  ; Build system
  (dune
   (and
    ; Build time dependency - https://opam.ocaml.org/doc/Manual.html#pkgvar-build
    :build
    (= 3.11)))
  ; Parser combinators built for speed and memory-efficiency
  (angstrom
   (= 0.15))
  ; A modular, clean and powerful extension of the OCaml standard library
  (containers
   (= 3.12))
  ; Fmt exposes combinators to devise Format pretty-printing functions
  (fmt
   (= 0.9.0))
  ; Simple list of suspensions, as a composable lazy iterator that behaves like a value
  (oseq
   (= 0.5))
  ; Functional Priority Search Queues
  (psq
   (= 0.2.1))
  ; Mainly for ppx_deriving.show
  ; show derives a function that inspects a value; that is, pretty-prints it with OCaml syntax
  (ppx_deriving
   (= 5.2.1))
  ; Alcotest is a lightweight and colourful test framework
  ; (alcotest
  ;  (and
  ;   ; For tests - https://opam.ocaml.org/doc/Manual.html#pkgvar-with-test
  ;   :with-test
  ;   (= 1.7.0)))
  ; ; Inline tests backend for Alcotest
  ; (ppx_inline_alcotest
  ;  (and
  ;   ; For tests
  ;   :with-test
  ;   (= 1.0.0)))
  (ppx_inline_test
   (and
    ; For tests
    :with-test
    (= 0.16.1)))
  (ppx_assert
   (and
    ; For tests
    :with-test
    (= 0.16.0)))
  (ppx_expect
   (and
    ; For tests
    :with-test
    (= 0.16.0)))
  ; An LSP server for OCaml.
  (ocaml-lsp-server
   (and
    ; Developer tooling - https://opam.ocaml.org/doc/Manual.html#pkgvar-with-dev-setup
    :with-dev-setup
    (>= 1.16.2)))
  ; Code formatter for OCaml
  (ocamlformat
   (and
    ; Developer tooling
    :with-dev-setup
    (= 0.26.1)))
  ; utop is an improved toplevel (i.e., Read-Eval-Print Loop or REPL) for OCaml
  (utop
   (and
    ; Developer tooling
    :with-dev-setup
    (>= 2.13.1)))))
