.PHONY: all eol noeol

all: eol noeol

eol:
	@echo '### eol with covermode=atomic'
	go test -cover -covermode=atomic ./$@

noeol:
	@echo '### noeol with covermode=atomic'
	go test -cover -covermode=atomic ./$@ || :
