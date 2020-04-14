CWD    = $(CURDIR)
MODULE = $(notdir $(CWD))

NOW = $(shell date +%d%m%y)
REL = $(shell git rev-parse --short=4 HEAD)

.PHONY: all
all: target/debug/rus
	$^

target/debug/rus: src/*.rs Cargo.toml Makefile
	cargo build && size $@ && file $@
