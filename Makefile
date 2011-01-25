include $(GOROOT)/src/Make.inc

TARG=golua

# Can have plain GOFILES too, but this example doesn't.

CGOFILES=\
	golua.go

CGO_LDFLAGS=lua-5.1.4/src/liblua.a

# Add the local Lua-5.1.4 root to include/ldconfig
CGO_CFLAGS=-Ilua-5.1.4/src

# List any files that should be cleaned here
CLEANFILES+=basic

include $(GOROOT)/src/Make.pkg

liblua:
	make -C lua-5.1.4 posix

# Simple test programs
basic: liblua install basic.go
	$(GC) basic.go
	$(LD) -o $@ basic.$O
