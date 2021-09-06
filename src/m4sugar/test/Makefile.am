
noinst_LIBRARIES    = libgreet.a libgreet.so
libgreet_a_SOURCES  = say_hello.c say_howdy.c
libgreet_so_SOURCES = $(libgreet_a_SOURCES)

noinst_PROGRAMS  = greeting
greeting_SOURCES = greeting.c
greeting_LDADD   = libgreet.a

TESTS = test_is_elf_cu
