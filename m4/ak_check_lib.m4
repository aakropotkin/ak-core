# -*- mode: autoconf; -*-
# ============================================================================ #
#
#
# ---------------------------------------------------------------------------- #

#serial 1

# Unlike regular `AC_CHECK_LIB', this macro yields several `AC_SUBST' values
# which collect additional library information that are frequently used.
#
# <LIBRARY>_LIB    ==> -l:<BASENAME>
# <LIBRARY>_LIBDIR ==> Directory name which contains the library
# <LIBRARY>_LIBS   ==> -L<LIBRARY>_LIBDIR <LIBRARY>_LIB <OTHER-LIBRARIES**>
#
# ** <OTHER-LIBRARIES> is narrowed to only list libraries which are "really"
#    necessary, so unused dependencies are dropped, unused library paths are
#    dropped, and for shared objects which use `NEEDED' and `RPATH'/`RUNPATH'
#    entries `-Wl,-rpath-link' may be added if it was required for a
#    successful link.


# AK_CHECK_LIB(LIBRARY, FUNCTION,
#              [ACTION-IF-FOUND], [ACTION-IF-NOT-FOUND],
#              [OTHER-LIBRARIES])
# ------------------------------------------------------
AC_DEFUN([AK_CHECK_LIB],
[m4_ifval([$3], , [AH_CHECK_LIB([$1])])dnl
AS_LITERAL_WORD_IF([$1],
  [AS_VAR_PUSHDEF([ak_Lib], [ak_cv_lib_$1_$2])],
  [AS_VAR_PUSHDEF([ak_Lib], [ak_cv_lit_$1""_$2])])dnl
AC_CACHE_CHECK([for $2 in -l$1], [ak_Lib],
[ak_check_lib_save_LIBS=$LIBS
LIBS="-t -l$1 $5 $LIBS"
AC_LINK_IFELSE([AC_LANG_CALL([], [$2])],
[AS_VAR_SET([ak_Lib], [yes])],
[AS_VAR_SET([ak_Lib], [no])])
LIBS=$ak_check_lib_save_LIBS])
AS_VAR_IF([ak_Lib], [yes]
          [m4_default([$3], [AC_DEFINE_UNQUOTED(AS_TR_CPP(HAVE_LIB$1))
          LIBS="-l$1 $LIBS"
          ])],
          [$4])
AS_VAR_POPDEF([ak_Lib])dnl
])# AK_CHECK_LIB


# ---------------------------------------------------------------------------- #



# ============================================================================ #
# vim: set filetype=config :
