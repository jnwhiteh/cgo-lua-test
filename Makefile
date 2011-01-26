include $(GOROOT)/src/Make.inc

TARG=golua

# Can have plain GOFILES too, but this example doesn't.

CGOFILES=\
	golua.go

CGO_CFLAGS=-Ilua-5.1.4/src
CGO_LDFLAGS=-lm

CGO_OFILES = \
			 lua-5.1.4/src/lapi.o \
			 lua-5.1.4/src/lauxlib.o \
			 lua-5.1.4/src/lbaselib.o \
			 lua-5.1.4/src/lcode.o \
			 lua-5.1.4/src/ldblib.o \
			 lua-5.1.4/src/ldebug.o \
			 lua-5.1.4/src/ldo.o \
			 lua-5.1.4/src/ldump.o \
			 lua-5.1.4/src/lfunc.o \
			 lua-5.1.4/src/lgc.o \
			 lua-5.1.4/src/linit.o \
			 lua-5.1.4/src/liolib.o \
			 lua-5.1.4/src/llex.o \
			 lua-5.1.4/src/lmathlib.o \
			 lua-5.1.4/src/lmem.o \
			 lua-5.1.4/src/loadlib.o \
			 lua-5.1.4/src/lobject.o \
			 lua-5.1.4/src/lopcodes.o \
			 lua-5.1.4/src/loslib.o \
			 lua-5.1.4/src/lparser.o \
			 lua-5.1.4/src/lstate.o \
			 lua-5.1.4/src/lstring.o \
			 lua-5.1.4/src/lstrlib.o \
			 lua-5.1.4/src/ltable.o \
			 lua-5.1.4/src/ltablib.o \
			 lua-5.1.4/src/ltm.o \
			 lua-5.1.4/src/lundump.o \
			 lua-5.1.4/src/lvm.o \
			 lua-5.1.4/src/lzio.o \
			 lua-5.1.4/src/print.o 

# List any files that should be cleaned here
CLEANFILES+=basic

include $(GOROOT)/src/Make.pkg

liblua:
	make -C lua-5.1.4 posix

pristine: clean
	make -C lua-5.1.4 clean

# Simple test programs
basic: liblua install basic.go
	$(GC) basic.go
	$(LD) -o $@ basic.$O

basicc: liblua
	cc -c -o basic.o -Ilua-5.1.4/src basic.c
	cc -o basic.aout basic.c lua-5.1.4/src/liblua.a
