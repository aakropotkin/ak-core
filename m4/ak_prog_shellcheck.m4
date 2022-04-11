# -*- mode: autoconf; -*-
# ============================================================================ #
#
#
# ---------------------------------------------------------------------------- #

#serial 1

# AK_PROG_shellcheck
AC_DEFUN_ONCE([AK_PROG_SHELLCHECK],
[AC_ARG_ENABLE([shellcheck],
  [AS_HELP_STRING([--enable-shellcheck@<:@@{:@yes|no@:}@@:>@],
                  [Turn on shellcheck tests])],
  [case "$enableval" in
    yes) enable_shellcheck=yes; ;;
    no)  enable_shellcheck=no;  ;;
    *) AC_MSG_ERROR([bad value $enableval for --enable-shellcheck]); ;;
  esac],
  [enable_shellcheck=no])
AM_CONDITIONAL([ENABLE_SHELLCHECK], [test "x$enable_shellcheck" = "xyes"])
AC_PATH_PROG([SHELLCHECK], [shellcheck])
AC_ARG_VAR([SHELLCHECK], [shellcheck linter])
AC_SUBST([SHELLCHECK])
])# AK_PROG_SHELLCHECK


# ---------------------------------------------------------------------------- #



# ============================================================================ #
# vim: set filetype=config :

