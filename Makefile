app = dlopen_sample
lib = libfoo.so libbar.so

CFLAGS = -Wall -ansi -pedantic -Wl,-rpath='$$ORIGIN:$$ORIGIN/A'
LDFLAGS = -ldl

all: $(app) $(lib)

libfoo.so: foo.c
	gcc -shared -fPIC $(CFLAGS) -o $@ $<
	cp libfoo.so B/libfoo.so

libbar.so: bar.c
	gcc -L./ -shared -lfoo -fPIC $(CFLAGS) -o $@ $<

clean:
	$(RM) $(app) $(lib)

$(lib): base.h
