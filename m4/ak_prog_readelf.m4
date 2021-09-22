# -*- mode: autoconf; -*-
# ============================================================================ #
#
#
# ---------------------------------------------------------------------------- #

AC_DEFUN([AK_PROG_READELF],
[AC_ARG_VAR([READELF], [path to readelf program])
AS_VAR_SET_IF([READELF],
              [AS_IF([$READELF -v],
                     [READELF=`realpath -s $READELF`
                      AC_SUBST([READELF])],
                     [AC_MSG_ERROR([path to readelf is invalid: $READELF])])],
              [AC_PATH_PROG([READELF], [readelf])])
])


# ---------------------------------------------------------------------------- #



# ============================================================================ #
# vim: set filetype=config :
