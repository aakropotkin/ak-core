
test_libdir = $(abs_top_builddir)/test/lib

test_lib_LTLIBRARIES = libgreet.la
libgreet_la_SOURCES = hello.c howdy.c

noinst_PROGRAMS = greet
greet_SOURCES   = greet.c
greet_LDADD     = libgreet.la

TESTS = test_is_elf_cu
