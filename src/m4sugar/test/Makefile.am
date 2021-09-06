
noinst_LTLIBRARIES    = libgreet.la
libgreet_la_SOURCES  = say_hello.c say_howdy.c

noinst_PROGRAMS  = greeting
greeting_SOURCES = greeting.c
greeting_LDADD   = libgreet.la

TESTS = test_is_elf_cu
