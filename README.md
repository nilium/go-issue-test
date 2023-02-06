go-issue-test
=============

This is a package to test a Go issue with `go test -cover -covermode=atomic` where the newline at the end of source
files is significant.

The tests can be run by hand or using `make` (with targets `all`, `eol`, or `noeol`).

eol
---

The `eol` directory should run tests with `go test -cover -covermode=atomic` successfully.

noeol
---

The `noeol` directory should run tests with `go test -cover -covermode=atomic` and fail with the following error:

```
# github.com/nilium/go-issue-test/noeol [github.com/nilium/go-issue-test/noeol.test]
noeol/empty.go:1:51: syntax error: unexpected var after top level declaration
FAIL    github.com/nilium/go-issue-test/noeol [build failed]
FAIL
```
