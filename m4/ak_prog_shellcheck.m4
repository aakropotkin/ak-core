# -*- mode: autoconf; -*-
# ============================================================================ #
#
# @file ak_prog_shellcheck.m4
#
# @brief Provides `shellcheck` tests
#
#
# ---------------------------------------------------------------------------- #

#serial 2

# ---------------------------------------------------------------------------- #

# AK_PROG_shellcheck
AC_DEFUN_ONCE([AK_PROG_SHELLCHECK],
[AC_REQUIRE([AK_PROG_MISSING])
AC_ARG_ENABLE([shellcheck],
  [AS_HELP_STRING([--enable-shellcheck@<:@@{:@yes|no@:}@@:>@],
                  [Turn on shellcheck tests])],
  [AS_CASE(["$enableval"],
    [yes], [enable_shellcheck=yes],
    [no],  [enable_shellcheck=no],
    [AC_MSG_ERROR([bad value $enableval for --enable-shellcheck])])],
  [enable_shellcheck=no])
AM_CONDITIONAL([ENABLE_SHELLCHECK], [test "$enable_shellcheck" = "yes"])
AC_PATH_PROG([SHELLCHECK], [shellcheck])
AC_ARG_VAR([SHELLCHECK], [shellcheck linter], [$MISSING shellcheck])
AC_SUBST([SHELLCHECK])
])# AK_PROG_SHELLCHECK


# ---------------------------------------------------------------------------- #
#
#
#
# ============================================================================ #
# vim: set filetype=config :

