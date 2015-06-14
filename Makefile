# CFLAGS=`pkg-config --cflags libpng` -g
# LIBS=`pkg-config --libs libpng`

PNGFLAGS := $(shell pkg-config libpng --cflags)
PNGLIBS := $(shell pkg-config libpng --libs)

BINARIES=png-text-append png-text-dump

.PHONY: all
all: png-text-append png-text-dump

png-text-append: png-text-append.o crc.o
	$(CC) -o$@ $^

png-text-dump: png-text-dump.o
	$(CC) $(PNGFLAGS) -o $@ $^ $(PNGLIBS)
	# $(CC) $(LIBS) -o$@ $^

clean: 
	rm -f $(BINARIES) *.o

