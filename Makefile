srcdir=		../Python-2.7.11
ALLLIBS=	$(srcdir)/libpython2.7.a -lnsl -ldl -lreadline -ltermcap -lieee -lpthread -lutil -lm

CFLAGS=		-g -Wall
CPPFLAGS=	-I$(srcdir)/Include -I$(srcdir)
LDFLAGS=	-Xlinker -export-dynamic

pyscript:	pyscript.o
		$(CC) $(LDFLAGS) pyscript.o $(ALLLIBS) -o pyscript

clean:
		-rm -f *.o core *~ @* '#'* pyscript

