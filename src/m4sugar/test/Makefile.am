
check_LTLIBRARIES = libgreet.la
libgreet_la_SOURCES = hello.c howdy.c
# For whatever fucking reason, `-rpath <PATH>' is the magic bullet that
# allows non-install libtool libraries to generate `.so' recipes.
# This is a stupid behavior but whatever...
libgreet_la_LDFLAGS = -rpath $(abs_builddir) $(AM_LDFLAGS)

noinst_PROGRAMS = greet
greet_SOURCES   = greet.c
greet_LDADD     = libgreet.la

libgreet_so_PATH = $(abs_builddir)/$(lt_obj_subdir)/libgreet.so

.PHONY: libgreet_path
libgreet_path: libgreet.la
	@echo $(libgreet_so_PATH)
	@test -x $(libgreet_so_PATH) && echo Y || echo N


#TESTS = test_is_elf_cu
