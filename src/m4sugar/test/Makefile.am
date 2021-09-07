
check_LTLIBRARIES = libgreet.la
libgreet_la_SOURCES = hello.c howdy.c
# For whatever fucking reason, `-rpath <PATH>' is the magic bullet that
# allows non-install libtool libraries to generate `.so' recipes.
# This is a stupid behavior but whatever...
libgreet_la_LDFLAGS = -rpath $(abs_builddir) $(AM_LDFLAGS)

noinst_PROGRAMS = greet
greet_SOURCES   = greet.c
greet_LDADD     = libgreet.la

#TESTS = test_is_elf_cu
