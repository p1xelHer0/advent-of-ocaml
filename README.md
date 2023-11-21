# ✨🐫🎄 Advent of OCaml 🎄🐫✨

> So you are thinking about doing [Advent of Code 2023](https://adventofcode.com/2023/) in [OCaml](https://ocaml.org/)? Great choice!

## Setting up the project

The official package manage of OCaml is Opam (OCaml Package Manager). Install
it by following the official instructions:

- https://ocaml.org/install

After Opam has been installed you can use the provided `Makefile` to get
going:

```
make setup
```

## Learning material

### Courses

- OCaml Programming: Correct + Efficient + Beautiful: https://cs3110.github.io/textbook/cover.html

  > This course also has an accompanying [YouTube playlist](https://www.youtube.com/playlist?list=PLre5AT9JnKShBOPeuiD9b-I4XROIJhkIU)!

### Books

- OCaml From The Very Beginning: https://johnwhitington.net/ocamlfromtheverybeginning/mlbook.pdf

- Introduction to Functional Programming and the Structure of Programming Languages using OCaml: https://www.ps.uni-saarland.de/~smolka/drafts/prog2021.pdf

- Real World OCaml 2nd Edition: http://dev.realworldocaml.org/

  > Note: Real World OCaml uses the alternative standard library [Base](https://github.com/janestreet/base)
  > If you want to use this, check out the [base
  > branch](https://github.com/p1xelHer0/advent_of_ocaml/tree/base)!

### Exercises

- https://ocaml.org/exercises

- https://ocamlsyntax.com/

- https://ocaml-sf.org/learn-ocaml-public/

---

> Want to jump into coding ASAP? Go to [tldr pls](#tldr-pls)

## Installing opam and OCaml

[opam](https://opam.ocaml.org/) is the OCaml Package Manager which we will be using in this project. We will use opam to install OCaml itself and packages.

### OCaml and opam

Install OCaml and opam according to the documentation found here: https://ocaml.org/install

> It's a good habit to keep opam updated by running
>
> ```bash
> opam update
> ```

### opam switch

We are going to install OCaml and packages needed local to the project with the following command

```bash
opam switch create -y . 5.1.0 --deps-only --with-test
```

This will create a ["switch"](https://ocaml.org/docs/opam-switch-introduction)

- `-y` means we answer "yes" to the questions during the installation.
- `.` means that the switch we are creating is local to the project since `.` refers
  to the current folder.
- `5.1.0` is the OCaml compiler version we are installing.
- `--deps-only` means that we install the dependencies of the project but not the project itself.
- `--with-test` means that we install the dependencies needed for running our tests.

For more info see `man opam-switch`

> Make sure to update your PATH with the following command after the installation
>
> ```bash
> eval $(opam env)
> ```

### Devtools

We are also going to install some developer tools

```bash
opam install ocaml-lsp-server ocamlformat utop -y
```

- [`ocaml-lsp-server`](https://github.com/ocaml/ocaml-lsp) is the de facto`*` [Language Server Protocol](https://microsoft.github.io/language-server-protocol/) implementation for OCaml.
- [`ocamlformat`](https://github.com/ocaml-ppx/ocamlformat) is the recommended`*` code formater tool for OCaml.
- [`utop`](https://github.com/ocaml-community/utop) is the recommended`*` REPL for OCaml.

> `*` de facto/recommended in the sense that all these tools are part of [The
> OCaml Platform](https://ocaml.org/docs/platform)

For more information about configuring your $EDITOR of choice see https://ocaml.org/docs/set-up-editor

For more information about `utop` see https://ocaml.org/docs/toplevel-introduction

## Building, running and testing the project using Dune

[Dune](https://dune.build/) is the recommended build system for OCaml and is
used in this project.

# tldr pls

Install opam according to the documentation found here: https://ocaml.org/install.

> ```bash
> opam update
> opam switch create -y . 5.1.0 --deps-only --with-test
> eval $(opam env)
> opam install ocaml-lsp-server ocamlformat utop -y
> ```

Now you can build and run the project for a specific day using

> All these command can be ran in "watch mode" by appending `-w`.
> Watch mode requires [`inotifywait`](https://linux.die.net/man/1/inotifywait) or [`fswatch`](https://github.com/emcrisostomo/fswatch) to be installed.

```
dune exec day_1
```

Run the inline tests for a specific day

```
dune test ./lib/day_1
```
