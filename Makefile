# Makefile for embedded Python use demo.
# (This version originally written on Red Hat Linux 6.1;
# edit lines marked with XXX.)

# XXX The compiler you are using
CC=	 	gcc

# XXX Top of the build tree and source tree
blddir=		../..
blddir=		../Python-2.7.11
srcdir=		../..
srcdir=		../Python-2.7.11

# Python version
VERSION=	2.7

# Compiler flags
OPT=		-g -Wall
INCLUDES=	-I$(srcdir)/Include -I$(blddir)
CFLAGS=		$(OPT)
CPPFLAGS=	$(INCLUDES)

# The Python library
LIBPYTHON=	$(blddir)/libpython$(VERSION).a

# XXX edit LIBS (in particular) to match $(blddir)/Makefile
LIBS=		-lnsl -ldl -lreadline -ltermcap -lieee -lpthread -lutil
LDFLAGS=	-Xlinker -export-dynamic
SYSLIBS=	-lm
MODLIBS=	
ALLLIBS=	$(LIBPYTHON) $(MODLIBS) $(LIBS) $(SYSLIBS)

# Build the demo applications

pyscript:	pyscript.o
		$(CC) $(LDFLAGS) pyscript.o $(ALLLIBS) -o pyscript
# Administrative targets

clean:
		-rm -f *.o core

clobber:	clean
		-rm -f *~ @* '#'* pyscript

realclean:	clobber
