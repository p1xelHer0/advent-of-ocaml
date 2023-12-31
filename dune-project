(lang dune 3.11)

; dune-project is the configuration file for the project
(name aoc)

; Let Dune generate our `aoc.opam` file to let
; opam know what what packages to install in our switch.
(generate_opam_files true)

(authors "p1xelHer0")

(maintainers "p1xelHer0")

(homepage "https://github.com/p1xelHer0/advent-of-ocaml")

(bug_reports "https://github.com/p1xelHer0/advent-of-ocaml/issues")

(license UNLICENSE)

(package
 (name aoc)
 (synopsis "Advent of Code in OCaml")
 (description
  "This repository contains a boilerplate project to solve Advent of Code in OCaml using Dune.")
 (depends
  ; Compiler version
  (ocaml
   (>= 5.1.0))
  ; Build system
  (dune
   (and
    ; Build time dependency - https://opam.ocaml.org/doc/Manual.html#pkgvar-build
    :build
    (>= 3.11.1)))
  ; Parser combinators built for speed and memory-efficiency
  (angstrom
   (>= 0.15.0))
  ; A modular, clean and powerful extension of the OCaml standard library
  (containers
   (>= 3.12))
  ; Simple list of suspensions, as a composable lazy iterator that behaves like a value
  (oseq
   (>= 0.5))
  ; Functional Priority Search Queues
  (psq
   (>= 0.2.1))
  ; Mainly for ppx_deriving.show
  ; show derives a function that inspects a value; that is, pretty-prints it with OCaml syntax
  (ppx_deriving
   (>= 5.2.1))
  ; A lightweight and colourful test framework
  (alcotest
   (and
    ; Test dependency - https://opam.ocaml.org/doc/Manual.html#pkgvar-with-test
    :with-test
    (>= 1.7.0)))
  (ppx_inline_alcotest
   (and
    ; Test dependency
    :with-test
    (>= 1.0.0)))
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
    (>= 0.26.1)))
  ; utop is an improved toplevel (i.e., Read-Eval-Print Loop or REPL) for OCaml
  (utop
   (and
    ; Developer tooling
    :with-dev-setup
    (>= 2.13.1)))))
