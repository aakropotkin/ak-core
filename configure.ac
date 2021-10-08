#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.71])
AC_INIT([ak-core], [0.0.1], [alex.ameen.tx@gmail.com])

AC_CONFIG_MACRO_DIRS([m4])
AC_CONFIG_AUX_DIR([build-aux])

AM_INIT_AUTOMAKE([foreign subdir-objects])

LT_PREREQ([2.4.6])
LT_INIT

AC_CONFIG_SRCDIR([src/sh-scripts/dt_entry.m4sh])

# Checks for programs.
AC_PROG_CC
AC_PROG_AWK
AC_PROG_CXX
AC_PROG_CPP
AC_PROG_INSTALL
AC_PROG_LN_S
AC_PROG_MAKE_SET
AC_PROG_MKDIR_P
AC_PROG_GREP
AC_PROG_SED
AC_PROG_AUTOM4TE

AC_SUBST([lt_obj_subdir], ["$lt_cv_objdir"])

AC_CONFIG_FILES([Makefile
                 src/Makefile
                 src/m4sugar/Makefile
                 src/m4sugar/test/Makefile
                 src/sh-scripts/Makefile
                 src/sh-scripts/test/Makefile
                 src/zsh-scripts/Makefile
                 src/awk-scripts/Makefile
                 src/jq/Makefile])
AC_OUTPUT
