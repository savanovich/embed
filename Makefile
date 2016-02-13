CC=	 	gcc

# XXX Top of the build tree and source tree
blddir=		../Python-2.7.11
srcdir=		../Python-2.7.11

# Python version
VERSION=	2.7

INCLUDES=	-I$(srcdir)/Include -I$(blddir)
CFLAGS=		-g -Wall
CPPFLAGS=	$(INCLUDES)

LIBPYTHON=	$(blddir)/libpython$(VERSION).a

LIBS=		-lnsl -ldl -lreadline -ltermcap -lieee -lpthread -lutil
LDFLAGS=	-Xlinker -export-dynamic
SYSLIBS=	-lm
ALLLIBS=	$(LIBPYTHON) $(MODLIBS) $(LIBS) $(SYSLIBS)


pyscript:	pyscript.o
		$(CC) $(LDFLAGS) pyscript.o $(ALLLIBS) -o pyscript

clean:
		-rm -f *.o core *~ @* '#'* pyscript

