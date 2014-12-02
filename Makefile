CC=erlc
OUTDIR=build
LDFLAGS=
CCFLAGS=-o $(OUTDIR)

SRC := $(wildcard src/*.erl)
OBJ := $(patsubst src/%.erl, src/%.beam, $(SRC))

all: compile

compile: build $(OBJ)

%.beam: %.erl
	$(CC) $(CCFLAGS) $^

build:
	mkdir $(OUTDIR)

clean:
	rm -rf $(OUTDIR)
