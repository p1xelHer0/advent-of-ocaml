# ✨🐫🎄 Advent of OCaml 🎄🐫✨

Let's do some [Advent of Code 2023](https://adventofcode.com/2023/) in [OCaml](https://ocaml.org/)!

> [!NOTE]
> Please open an issue or reach out to me on [Twitter](https://twitter.com/p1xelHer0) or [Mastodon](https://hachyderm.io/@p1xelHer0)
> if you have any questions, recomendations or just want to say hi!

## Leaderboard

> [!TIP]
> There is an [Advent of OCaml list on Twitter](https://twitter.com/i/lists/1725835790037455203) and a Advent of Code leaderboard by [Sabine](https://twitter.com/sabine_s_):
>
> ```
> 3236051-3f7ecc0b
> ```
>
> https://adventofcode.com/2023/leaderboard/private

## Setup

> [!WARNING]
> I have never tried this on Windows

The official package manage of OCaml is Opam (OCaml Package Manager). Install
it by following the official instructions:

- https://ocaml.org/install

  > Personally I've tried installing Opam on macOS with both `brew` and
  > `nix` - both have worked for me.

After Opam has been installed you can use the provided [`Makefile`](./Makefile) to get
going:

> [!CAUTION]
> If you already have an old installation of Opam make sure you run `opam update` before setting up!

Running `make` should give you some instructions. Lets setup the project:

```
make setup
```

This install OCaml itself in a local [Opam switch](https://ocaml.org/docs/opam-switch-introduction), the dependencies for the project and also [ocaml-lsp-server](https://github.com/ocaml/ocaml-lsp),
[ocamlformat](https://github.com/ocaml-ppx/ocamlformat) and [utop](https://github.com/ocaml-community/utop).

Before running a command, make sure your Opam environment is in sync with your
local switch. You can do this by running

```
opam switch
```

This should tell you the following:

```
[NOTE] Current switch has been selected based on the current directory.
       The current global system switch is default.
```

> [!CAUTION]
> Sometime the current switch can get out of sync when navigating back and fourth
> between folders, you can sync the switch by running:
>
> ```
> eval $(opam env)
> ```

## Before coding

If this is your first time doing OCaml consider reading more about it at the
official website https://ocaml.org/. You can find information about everything
from configuring you editor (with the LSP we installed) to syntax.

If this is your first time doing Advent of Code you should consider spending five minutes to read the about page: https://adventofcode.com/2023/about

> [!TIP]
> Personally, I think Advent of Code is _hard_.
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

- Paste your puzzle input into `./day_01/input.txt`

- open `./day_01/solution_01.ml` and read the comments

- Put general utility function in the `./lib/utils.ml` module - use them in your
  solution with the `Util` module

- Take a look in the `./examples` to see some uses of testing, modules and
  parsing

### Running without tests

If you don't wanna run tests and just print to `stdout` you can do the
following:

```
dune exec ./day_01/run_1.exe ./day_01/input.txt -w
```

> Change your `day_01` and `run_1` accordingly to day and part

### The long story

To be frank, this repository has been a bit of experimentation to learning [Dune](https://dune.build/).
To learn workflows more than "run the program, print the result." The way I
intend to work on my solutions (after getting some nice feedback on the OCaml
forums [here](https://discuss.ocaml.org/t/running-executable-and-inline-tests-in-watch-mode-at-them-same-time-for-advent-of-code/13478)) this year is by doing the following:

- _Inline tests_ with the library [Alcotest](https://github.com/mirage/alcotest)

- _Integration tests_ with Dune [diffing](https://dune.readthedocs.io/en/stable/tests.html#diffing-the-result) and [promotion](https://dune.readthedocs.io/en/stable/concepts/promotion.html#promotion)

- Writing a bunch of questionable OCaml until shit works

- Complain about the fact that Python actually looks really nice for solving
  these kind of problems

Start with opening the file `./day_01/solution_01.ml`. This file contains a lot
of comments (don't worry, the other days don't), read those and you should be good to go.

- Take a look in the `./lib/exmaples.ml` module for some other neat things

I've include a lot of comments in a lot of files to guide the users through the
usage of Opam, dune, testing, and more. You could perhaps take a look in the `Makefile` or the
`dune` file in `./day_01` as well.

### Inline tests

Inline testing is the idea of defining tests inside your programs source
file instead of a separate test file. I think this kind of testing suits
Advent of Code nicely. Some examples of inline tests can be found in
`./examples/testing.ml`.

### Integration tests

This might sound dumb but technically we are doing an integration test. We test
the output of each day when printing the result. You can print the result by
uncommenting `(* Run.solve_int (module A); *)` part. This should show the
result as a `diff` in your terminal. Copy it and submit it as your solution.
If it's correct run`dune promote`. This saves the result in your `p1.expected` file.

If you feel like doing a refactor of your day (yes this will happen, going
back to a day and polish it after seeing how other people solved it is _fun_)
you verify that your output matches the contents of the promoted file `p1.expected`.

### Testing the workflow yourself

The current state of the project is:

- Day 1 Part 1 is already solved

- Day 1 Part 2 is failing our sample test: can you fix it?

  > Hint: there is a unneeded `+ 1` there!

- After the test stops failing: run the program for real, uncomment the
  `Run.solve_int` function.run, the result should be printed in your terminal.

  Run `dune promote`

- Check the `./day_01/p2.expected`

- No tests should be failing

## Dune commands for those curious

```
## Building

dune build # build the project

dune build ./day_01 # build day_01

dune build ./day_01 -w # build day_01 in watch mode


## Executing programs

dune exec ./completed_days.exe # show completed days

dune exec ./day_01/run_1.exe # run Day 1 Part 1

dune exec ./day_01/run_2.exe # run Day 1 Part 2


## Testing

dune test # run all tests in the project

dune test ./day_01 # run all tests for day_01

dune test ./day_01 -w # run all tests for day_01 in watch mode


## Promoting

dune promote


## Formatting

dune fmt # this shows the expected formatting

dune fmt --auto-promote # do the actual formatting
```

## Packages

I've heard people say that you shouldn't use packages for Advent of Code
because...? I don't care lmao:

- The standard library of OCaml is pretty minimal by design

- I don't want to implement my own priority search queue, for now

- PPXes are cool

- Tests are not cool but good sometimes

### [Containers](https://github.com/c-cube/ocaml-containers/) and [OSeq](https://github.com/c-cube/oseq)

Two extensions of the standard library. I like them because it does not replace
the standard library: it still feels like writing "pure" OCaml with some extra
niceties.

### [Angstrom](https://github.com/inhabitedtype/angstrom)

Some day I will learn to use this properly. Parsing!

### [psq](https://github.com/pqwy/psq)

Priority Search Queue. I've used this when implementing the Dijkstra's algorithm.

### [ppx_deriving](https://github.com/ocaml-ppx/ppx_deriving)

The whole thing is about generating code! See `./examples/modules.ml` under the `(* ppx_deriving *)` comment.

### [Alcotest](https://github.com/mirage/alcotest) with [ppx_inline_alcotest](https://gitlab.com/gopiandcode/ppx-inline-alcotest)

Used for testing, primarily inline testing in this case.

## Adding packages

To add a new package to the project:

- Find the package you want to add using the OCaml website: https://ocaml.org/packages

- Edit your `dune-project` file under the `depends` stanza and add the package `(mypackage (>= 1.2.3))`

- Rebuild you project using `make build` to generate a new `aoc.opam` file

- Run `make package`

- Add the package to your module of choice by editing it's `dune` file:

  Let's add the package to our `./day_01/solution_01.ml` Module:

  - Open the `./day_01/dune` file

  - Add your package under the `libraries` stanza: `(libraries aoc angstrom containers oseq mypackage)`

  - Build the project `make build`

  You should now be able to find the package in you `solution_01.ml` file by
  using `Mypackage` - Success!

## Learning material

Here is an assortments of free material for learning OCaml. Shoutout to the
creators of these! <3

### Official website

Start at the https://ocaml.org/docs/values-and-functions and make your way through.

### Courses and books

- OCaml Programming: Correct + Efficient + Beautiful: https://cs3110.github.io/textbook/cover.html

  > This course also has an accompanying [YouTube playlist](https://www.youtube.com/playlist?list=PLre5AT9JnKShBOPeuiD9b-I4XROIJhkIU)!

- OCaml From The Very Beginning: https://johnwhitington.net/ocamlfromtheverybeginning/mlbook.pdf

- Introduction to Functional Programming and the Structure of Programming Languages using OCaml: https://www.ps.uni-saarland.de/~smolka/drafts/prog2021.pdf

- Real World OCaml 2nd Edition: http://dev.realworldocaml.org/

  > Note: Real World OCaml uses the alternative standard library [Base](https://github.com/janestreet/base)
  > If you want to use `base` then follow the instructions [here](#adding-packages)

### Exercises

- https://ocaml.org/exercises

- https://ocaml-sf.org/learn-ocaml-public/

### Syntax quirks

- https://ocamlsyntax.com/

## Closing notes

There is probably something I have missed. I've tried to leave comments in the
source code of most things. The `dune` files, the `mli`-files, the `Makefile` and
more. Have a look around and see if things makes sense!

If you made it this far, thank you!

# Take care and have a lovely christmas ❤️ 🎄
