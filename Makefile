app = dlopen_sample
lib = libfoo.so libfoo2.so libbar.so

CFLAGS = -Wall -ansi -pedantic -Wl,-rpath='$$ORIGIN:$$ORIGIN/A'
LDFLAGS = -ldl

all: $(app) $(lib)

libfoo.so: foo1.c
	gcc -shared -fPIC $(CFLAGS) -o $@ $<

libfoo2.so: foo2.c
	gcc -shared -fPIC $(CFLAGS) -o $@ $<
	mv libfoo2.so B/libfoo.so

libbar.so: bar.c
	gcc -L./ -shared -lfoo -fPIC $(CFLAGS) -o $@ $<
	mv libfoo.so A/libfoo.so

clean:
	$(RM) $(app) $(lib)

$(lib): foo.h
