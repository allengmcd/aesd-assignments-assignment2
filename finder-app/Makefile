CROSS_COMPILE ?= 

IDIR =./
CC=$(CROSS_COMPILE)gcc
CFLAGS=-I$(IDIR)

ODIR=./
LDIR =../lib

LIBS=-lm

_OBJ = writer.o 
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))


$(ODIR)/%.o: %.c 
	$(CC) -c -o $@ $< $(CFLAGS)

writer: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)

.PHONY: clean

clean:
	rm -f $(ODIR)/*.o *~ core $(INCDIR)/*~ 