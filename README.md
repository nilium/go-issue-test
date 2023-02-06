go-issue-test
=============

This is a package to test a Go issue with `go test -cover -covermode=atomic` where the newline at the end of source
files is significant. This only affects Go 1.20 -- tests on 1.19.5 succeed.

The tests can be run by hand or using `make` (with targets `all`, `eol`, `noeol`, or `coverage.diff`). Both targets will
produce their empty.go.cover files under their package directories to inspect how the cover tool generates code for
each.

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

This appears to be due to the `cover` tool generating code roughly like the following for the `noeol/empty.go` file (the
full output can be found in `noeol/empty.go.cover`):

```go
//line noeol/empty.go:1:1
package noeol; import _cover_atomic_ "sync/atomic"var _ = _cover_atomic_.LoadUint32
```

Notably, there is no semicolon or newline between the `_cover_atomic_` import and the `var _` declaration.
