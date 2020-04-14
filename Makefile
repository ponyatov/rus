CWD    = $(CURDIR)
MODULE = $(notdir $(CWD))

NOW = $(shell date +%d%m%y)
REL = $(shell git rev-parse --short=4 HEAD)

CARGO = $(HOME)/.cargo/bin/cargo
RUSTC = $(HOME)/.cargo/bin/rustc



.PHONY: all
all: target/debug/rus
	$^

target/debug/rus: src/*.rs Cargo.toml Makefile
	$(CARGO) build && size $@ && file $@



.PHONY: install update
install: debian $(CARGO) $(RUSTC)
update:  debian

.PHONY: debian
debian:
	sudo apt update
	sudo apt install -u make git build-essential qemu-system-x86


.PHONY: master shadow release zip

MERGE  = Makefile README.md .gitignore .vscode doc
MERGE += src Cargo.toml

master:
	git checkout $@
	git checkout shadow -- $(MERGE)

shadow:
	git checkout $@

release:
	git tag $(NOW)-$(REL)
	git push -v && git push -v --tags
	git checkout shadow

zip:
	git archive --format zip --output $(MODULE)_src_$(NOW)_$(REL).zip HEAD
