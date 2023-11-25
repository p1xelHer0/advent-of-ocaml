# ✨🐫🎄 Advent of OCaml 🎄🐫✨

> So you are thinking about doing [Advent of Code 2023](https://adventofcode.com/2023/) in [OCaml](https://ocaml.org/)? Great choice!

## Setting up the project

The official package manage of OCaml is Opam (OCaml Package Manager). Install
it by following the official instructions:

- https://ocaml.org/install

After Opam has been installed you can use the provided [`Makefile`](./Makefile) to get
going:

> [!IMPORTANT]
> If you already have an old installation of Opam make sure you run `opam update` before setting up

```
make setup
```

This install OCaml itself, the dependencies for the project and also [ocaml-lsp-server](https://github.com/ocaml/ocaml-lsp),
[ocamlformat](https://github.com/ocaml-ppx/ocamlformat) and [utop](https://github.com/ocaml-community/utop).

After the installation you can build the project with:

```
make build
```

> [!IMPORTANT]
> You don't wanna read shit or test shit? Consider checking out the [minimal
> branch](TLDR)

## Before coding

> [!IMPORTANT]
> If this is your first time doing Advent of Code you should consider spending five minutes to read the about page:
> https://adventofcode.com/2023/about

> [!TIP]
> Advent of Code is _hard_.
>
> I don't work with these kind of algorithm-y problems on a day-to-day basis. I guess most people don't. It's easy to get impostor syndrome and compare yourself to others. Others that do good in Advent of Code has probably done so for some time.
>
> Find a group and discuss the problems with others. You probably have a colleague at work that does Advent of Code without you even knowing. Your favorite streamer or YouTuber might have a dedicated Discord channel.
>
> Focus on learning and having fun.
>
> And lose a bit of sleep!

## Intended workflow

To start working on a day run

> [!IMPORTANT]
> Days are indexed `{01..25}` - don't forget the leading 0 - because I am 0x
> developer

```
make day01
```

### TL;DR

- open `./day_01/solution_01.ml` and read the comments

### The long story

To be frank, this repository has been a bit of experimentation to learning Dune.
To learn workflows more than "run the program, print the result." The way I
intend to work on my solutions (after getting some nice feedback on the OCaml
forums [here](https://discuss.ocaml.org/t/running-executable-and-inline-tests-in-watch-mode-at-them-same-time-for-advent-of-code/13478)) this year by doing the following:

- _Inline tests_ with the library [Alcotest](https://github.com/mirage/alcotest)

- _Integration tests_ with Dune [diffing](https://dune.readthedocs.io/en/stable/tests.html#diffing-the-result) and [promotion](https://dune.readthedocs.io/en/stable/concepts/promotion.html#promotion)

- Writing a bunch of questionable OCaml until shit works

- Complain about the fact that Python actually looks really nice for solving
  these kind of problems

Start with opening the file `./day_01/solution_01.ml`. This file contains a lot
of comments (don't worry, the other days don't), read those and you should be good to go.

I've include a lot of comments in a lot of files to guide the users through the usage of Opam, dune, testing, and more. You could perhaps take a look in the `Makefile` or the
`dune-project` file.

### Inline tests

Inline testing is the idea of defining tests inside your programs source
file instead of a separate test file. I think this kind of testing suits
Advent of Code nicely. Some examples of inline tests can be found in
`./lib/examples.ml` under the comment `(* Testing *)`.

### Integration tests

This might sound dumb but technically we are doing an integration test. We test
the output of each day when printing the result. You can print the result by
uncommenting `( Run.solve_string (module A); ) part. This should show the
result as a git diff in your terminal. Copy it and submit it as your solution.
If it's correct run `dune promote`. This saves the result in your `p1.expected`file. If you feel like doing a refactor of your day (yes this will happen, going
back to a day and polish it after seeing how other people solved it is _fun_)
you verify that your output matches the contents of the promoted file `p1.expected`.

## Learning material

### Courses and books

- OCaml Programming: Correct + Efficient + Beautiful: https://cs3110.github.io/textbook/cover.html

  > This course also has an accompanying [YouTube playlist](https://www.youtube.com/playlist?list=PLre5AT9JnKShBOPeuiD9b-I4XROIJhkIU)!

- OCaml From The Very Beginning: https://johnwhitington.net/ocamlfromtheverybeginning/mlbook.pdf

- Introduction to Functional Programming and the Structure of Programming Languages using OCaml: https://www.ps.uni-saarland.de/~smolka/drafts/prog2021.pdf

- Real World OCaml 2nd Edition: http://dev.realworldocaml.org/

  > Note: Real World OCaml uses the alternative standard library [Base](https://github.com/janestreet/base)

### Exercises

- https://ocaml.org/exercises

- https://ocaml-sf.org/learn-ocaml-public/

### Syntax quirks

- https://ocamlsyntax.com/

### Leaderboard

https://adventofcode.com/2023/leaderboard/private

```
3236051-3f7ecc0b
```
