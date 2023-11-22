.DEFAULT_GOAL := help

.PHONY: help
help:
	@echo "- make setup		Create an Opam switch, install dependencies and developer tools"
	@echo "- make build		Build the project"
	@echo "- make watch		Build the project in \"watch mode\" 	NOTE: Requires fswatch or inotifywait"
	@echo "- make test		Run the projects tests"
	@echo "- make test-watch	Run the projects test in \"watch mode\" 	NOTE: Requires fswatch or inotifywait"
	@echo "- make clean		Clean the project"
	@echo "- make fmt		Format the project using ocamlformat	NOTE: see .ocamlformat for configuration"
	@echo "- make utop		Run UTOP the OCaml REPL"
	@echo "- make day1		Run Day 1				NOTE: Change 1 accordingly, to run day 22 simply use make day22"

.PHONY: setup
setup: ## Install project and development dependencies
	opam switch create . 5.1.0 --no-install
	opam install . -y --deps-only --with-test
	opam install -y ocamlformat=0.26.1 ocaml-lsp-server utop

.PHONY: build
build: ## Build the project
	dune build --root .

.PHONY: watch
watch: ## Run build in "watch mode" - requires fswatch or inotifywait
	dune build --root . -fw

.PHONY: test
test: ## Run tests
	dune build --root . @runtest -f

.PHONY: test-watch
test-watch: ## Run tests in "watch mode" - requires fswatch or inotifywait
	dune build --root . @runtest -fw

.PHONY: clean
clean: ## Clean the project
	dune clean --root .

.PHONY: fmt
fmt: ## Format source code
	dune build --root . --auto-promote @fmt

.PHONY: utop
utop: ## Run a REPL
	dune utop --root . . -- -implicit-bindings

.PHONY: reset
reset: ## Remove local opam switch
	rm -rf ./_opam

## Don't look further, my Makefile skills is around 0!
.PHONY: day1
day1: ## Run Day 1
	dune exec 1 -f

.PHONY: day2
day2: ## Run Day 2
	dune exec 2 -f

.PHONY: day3
day3: ## Run Day 3
	dune exec 3 -f

.PHONY: day4
day4: ## Run Day 4
	dune exec 4 -f

.PHONY: day5
day5: ## Run Day 5
	dune exec 5 -f

.PHONY: day6
day6: ## Run Day 6
	dune exec 6 -f

.PHONY: day7
day7: ## Run Day 7
	dune exec 7 -f

.PHONY: day8
day8: ## Run Day 8
	dune exec 8 -f

.PHONY: day9
day9: ## Run Day 9
	dune exec 9 -f

.PHONY: day10
day10: ## Run Day 10
	dune exec 10 -f

.PHONY: day11
day11: ## Run Day 11
	dune exec 11 -f

.PHONY: day12
day12: ## Run Day 12
	dune exec 12 -f

.PHONY: day13
day13: ## Run Day 13
	dune exec 13 -f

.PHONY: day14
day14: ## Run Day 14
	dune exec 14 -f

.PHONY: day15
day15: ## Run Day 15
	dune exec 15 -f

.PHONY: day16
day16: ## Run Day 16
	dune exec 16 -f

.PHONY: day17
day17: ## Run Day 17
	dune exec 17 -f

.PHONY: day18
day18: ## Run Day 18
	dune exec 18 -f

.PHONY: day19
day19: ## Run Day 19
	dune exec 19 -f

.PHONY: day20
day20: ## Run Day 20
	dune exec 20 -f

.PHONY: day21
day21: ## Run Day 21
	dune exec 21 -f

.PHONY: day22
day22: ## Run Day 22
	dune exec 22 -f

.PHONY: day23
day23: ## Run Day 23
	dune exec 23 -f

.PHONY: day24
day24: ## Run Day 24
	dune exec 24 -f

.PHONY: day25
day25: ## Run Day 25
	dune exec 25 -f
