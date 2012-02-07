CC	= gcc
#CFLAGS	= -g -O0 -Wall `pkg-config gtk+-2.0 --cflags`

##removed gtk stuff
CFLAGS	= -g -O0 -Wall
LD	= gcc
LDFLAGS	=
#removed gtk stuff
#LIBS	= `pkg-config gtk+-2.0 --libs`
BIN	= get_stuff
OBJS	= skype.o util.o main.o flash.o plugin.o

.c.o:
	$(CC) -c $(CFLAGS) -o $*.o $<

all: $(BIN)

$(BIN): $(OBJS)
	$(LD) -o $@ $(LDFLAGS) $(OBJS) $(LIBS)

clean:
	rm -f $(BIN) $(OBJS) *~ core

depend: Makefile
	$(CC) -c -MM $(OBJS:.o=.c) > $@

include depend
