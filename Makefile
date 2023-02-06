.PHONY: all eol noeol

all: eol noeol coverage.diff

eol noeol:
	@echo '### $@ with covermode=atomic'
	go test -cover -covermode=atomic ./$@ || :
	go tool cover -mode=atomic -var=CoverageVariableName -pkgcfg=$@/cover.json -outfilelist=$@/cover-out.txt $@/empty.go

coverage.diff: eol noeol
	diff -U2 eol/empty.go.cover noeol/empty.go.cover | tee $@
