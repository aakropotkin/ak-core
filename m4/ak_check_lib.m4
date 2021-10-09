# -*- mode: autoconf; -*-
# ============================================================================ #
#
#
# ---------------------------------------------------------------------------- #

# AK_CHECK_LIB(LIBRARY, FUNCTION, LIBS,
#              [ACTION-IF-FOUND], [ACTION-IF-NOT-FOUND],
#              [OTHER-LIBRARIES])
# ----------------------------------------------------------
# Similar to `AC_CHECK_LIB', except rather than linking with `-l$1' instead
# argument 3 ( `LIBS' ) is used to test linkage.
# Argument 1 ( `LIBNAME' ) is still used to set cache values, and set
# `autoheader' defines ( `HAVE_$1' ).
# The only other notable change is that rather than adding `-l$1' to the global
# `LIBS' flags, we set `$1_LIBS="$3";'.
# These behaviors make `AK_CHECK_LIB' more convenient for handling flags
# for abstract interfaces or packages.
AC_DEFUN([AK_CHECK_LIB],
[AS_LITERAL_WORD_IF([$1],
                    [AS_VAR_PUSHDEF([ak_Lib], [ac_cv_lib_$1_$2])],
                    [AS_VAR_PUSHDEF([ak_Lib], [ac_cv_lib_$1""_$2])])dnl
AC_CACHE_CHECK([for $2 in lib$1], [ak_Lib],
               [ak_check_lib_save_LIBS="$LIBS"
               LIBS="$3 $5 $LIBS"
               AC_LINK_IFELSE([AC_LANG_CALL([], [$2])],
                              [AS_VAR_SET([ak_Lib], [yes])],
                              [AS_VAR_SET([ak_Lib], [no])])
               LIBS="$ak_check_lib_save_LIBS"])
AS_VAR_IF([ak_Lib], [yes],
          [m4_default([$4], [AC_DEFINE_UNQUOTED(AS_TR_CPP(HAVE_LIB$1))
                            AS_VAR_SET([$1_LIBS], ["$3"])])],
          [$5])
AS_VAR_POPDEF([ak_Lib])dnl
])# AK_CHECK_LIB



# ---------------------------------------------------------------------------- #



# ============================================================================ #
# vim: set filetype=config :
