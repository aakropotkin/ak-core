
check_LTLIBRARIES = libgreet.la
libgreet_la_SOURCES = hello.c howdy.c
# For whatever fucking reason, `-rpath <PATH>' is the magic bullet that
# allows non-install libtool libraries to generate `.so' recipes.
# This is a stupid behavior but whatever...
libgreet_la_LDFLAGS = -rpath $(abs_builddir) $(AM_LDFLAGS)

check_PROGRAMS = greet
greet_SOURCES  = greet.c
greet_LDADD    = libgreet.la


libgreet_so_PATH = $(abs_builddir)/$(lt_obj_subdir)/libgreet.so
libgreet_a_PATH = $(abs_builddir)/$(lt_obj_subdir)/libgreet.a

.PHONY: libgreet_paths
libgreet_paths: libgreet.la
	@echo -n '$(libgreet_so_PATH): '
	@test -x $(libgreet_so_PATH) && echo 'found' || echo 'not found'
	@echo -n '$(libgreet_a_PATH): '
	@test -e $(libgreet_a_PATH) && echo 'found' || echo 'not found'


check_SCRIPTS = test-is-elf-cu.sh test-cdeps.sh
TESTS = $(check_SCRIPTS)

test-is-elf-cu.sh: | ../is-elf-cu hello.o howdy.o greet.o
test-cdeps.sh: | ../cdeps cdeps-a.h cdeps-b.h cdeps-c.h cdeps-a.c cdeps-c.c
