Hi folks! I have some problems I want to solve: I am building a little
boilerplate project for https://adventofcode.com/ and I've stumbled into some
problems in regards to `dune exec`, `dune test` and `--watch`:

Excuse my long thread but I felt it was better to write down everything I've tried. the project looks like this can can be found in the `development` branch here https://github.com/p1xelHer0/advent-of-ocaml/tree/development

```
.
├── \_build
├── \_opam
├── day_01..25 - self-contained library and executable
│   ├── dune
│   ├── input
│   ├── puzzle_01.ml - solution to AoC, contains inline tests
│   └── runner.ml - executable, calls the `run` function from `Puzzle_01`
├── lib
│  ├── dune
│  └── util.ml - library all other modules can use, can contain tests
├── aoc.opam
├── dune
└── dune-project
```

The idea here is that each day I, or some other user, would start a

`dune exec ./day_01/runner.exe -w`

and a

`dune test ./day_01 -w`

To get immediate feedback on the test of the example data and the output of the written program.

Now, this does not work since dune locks the `_build` directory.
This lock CAN be disabled with setting `DUNE_CONFIG__GLOBAL_LOCK=disabled` but
now the processes crash instead, so this does not work in my case.

My approach to this was to create an `alias`:

```
(rule
 (alias 1)
 (deps ./day_01/input)
 (action
  (progn
   (run dune build ./day_01)
   (run ./day_01/runner.exe))))
```

Now, using `dune build @1 -w` and achieve the same thing as `dune exec
./day_01/runner.exe -w`. (I'm not sure if it's the EXACT same thing but you get
idea...).

Defining this as an alias allow us to use multiple aliases for the `dune build`
command:

`dune build @1 @runtest -w`

The issue now become that the `runtest` alias runs ALL the tests of the project,
not just the test for `day_01`. So if I user leaves Day 1 of Advent of Code
uncompleted and move on to day 2 they'd have to clean up the file before moving
on. That's not good!

I have not been able to pass parameters to the `runtest` alias when using the
`build` command above. I was thinking something in the lines of:

`dune build @1 @runtest ./day_01 -w`. But that does not work, it still runs my
tests in `./day_02` and `lib/util.ml`.

Another idea I had was to expand my alias to include the tests in the alias
itself:

```
(rule
 (alias 1)
 (deps ./day_01/input)
 (action
  (progn
   (run dune build ./day_01)

   ; This seems like the easiest most straightforward solution?
   ; But this does not seem to work, or any alternative for that matter, be it
   ; runtest, build @runtest etc
   (run dune test ./day_01)

   ; An idea I had was to run the inline test directly:
   (run ./day_01/.puzzle_01.inline-tests/inline_test_runner_puzzle_01.exe)

   (run ./day_01/runner.exe))))
```

Now `ppx_inline_test` specificly mentions that you can't run the test executable
directly. Doing this results in the following:

```
You are doing something unexpected with the tests. No tests have
been run. You should use the inline_tests_runner script to run
tests.
```

The README mentions this here: https://github.com/janestreet/ppx_inline_test#building-and-running-the-tests-outside-of-jane-street-without-dune

But the best I could get from the test executable was:

`(run /day_01/.puzzle_01.inline-tests/inline_test_runner_puzzle_01.exe inline-test-runner Puzzle_01)`

This prints _nothing_.

I can verify by passing the `-show-counts` option to the test:

```
0 tests ran, 0 test_modules ran
```

Maybe I am missing something here? There also seems to be an issue open in
regards to running a single test, not sure if related to this: https://github.com/janestreet/ppx_inline_test/issues/34

So in the end, `dune build @1 @runtest -w` is the closest I've gotten. But I
don't feel like it's good enough. I can do better. I would like the `runtest`
alias only run the tests in the `day_01` folder.

Thank you so much for taking your time to read this! I realize now that I
should've asked for help much earlier but on the flip side I've learned a lot
about dune! Am I even approaching this problem from the right angle? :smiley:
