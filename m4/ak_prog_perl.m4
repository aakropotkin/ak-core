# -*- mode: autoconf; -*-
# ============================================================================ #
#
#
# ---------------------------------------------------------------------------- #

#serial 1

# ---------------------------------------------------------------------------- #

# AK_PROG_PERL
AC_DEFUN([AK_PROG_PERL],
[AX_REQUIRE_DEFINED([AK_REALPATH_S])
AC_ARG_VAR([PERL], [absolute path to perl interpreter])
AS_VAR_SET_IF([PERL],
              [AC_SUBST([PERL], [AK_REALPATH_S([$PERL])])],
              [AC_PATH_PROG([PERL], [perl])])
AS_IF([$PERL -V 2>&1 1>/dev/null],
      [ak_perl_ok=yes],
      [ak_perl_ok=no])
])# AK_PROG_PERL


# ---------------------------------------------------------------------------- #



# ============================================================================ #
# vim: set filetype=conf :
