SHELL = /usr/bin/env bash

SCANNER = scanner.ozg
PARSER = parser.ozg
SYNTAX = $(SCANNER) $(PARSER)

.PHONY:
all:
	ozc -x oz.oz
	$(MAKE) test

.PHONY:
test: oz
	@./oz example-program.oz

.PHONY:
clean:
	rm -Rf *.{C,l,o} *.so* *.output *.simplified
