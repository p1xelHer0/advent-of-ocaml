.DEFAULT_GOAL := help

.PHONY: help
help:
	@echo "  make setup followed by make day01 should be everything you need"
	@echo ""
	@echo "- make setup		Create an local Opam switch, install dependencies, developer tools and build the project"
	@echo "- make dependencies	Install project dependencies and developer tools"
	@echo "- make switch		Create an local Opam switch"
	@echo "- make build		Build the project"
	@echo "- make packages		Install packages defined in your .opam file"
	@echo "- make day01		Run Day 1 in watch mode - number below 10 are prefixed with 0"
	@echo "  ..."
	@echo "- make day25		Run Day 25 in watch mode"
	@echo "- make completed		Show completed days"
	@echo "- make clean		Clean the project"
	@echo "- make fmt		Format the project, see .ocamlformat for configuration"
	@echo "- make utop		Run UTOP, the OCaml REPL"
	@echo "- make reset		Remove the local Opam switch"

.PHONY: setup
setup: ## Create an local Opam switch, install dependencies, developer tools and build the project"
	make switch
	make dependencies
	make build

.PHONY: dependencies
dependencies: ## Install project dependencies and development tools
	make package
	opam install -y ocamlformat=0.26.1 ocaml-lsp-server utop

.PHONY: switch
switch: ## Create an local Opam switch
	opam switch create . 5.1.0 --no-install

.PHONY: build
build: ## Build the project
	dune build

.PHONY: package
package: ## Install packages defined in your .opam file
	opam install . -y --deps-only --with-test

.PHONY: completed
completed: ## Show completed days
	dune exec ./completed_days.exe

.PHONY: clean
clean: ## Clean the project
	dune clean

.PHONY: fmt
fmt: ## Format the project, see .ocamlformat for configuration"
	dune build --auto-promote @fmt

.PHONY: utop
utop: ## Run UTOP, the OCaml REPL
	dune utop .

.PHONY: reset
reset: ## Remove local opam switch
	rm -rf ./_opam

day%: ## Run a day given the input - make day01
	dune test ./day_$* -w
