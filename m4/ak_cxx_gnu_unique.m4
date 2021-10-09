# -*- mode: autoconf; -*-
# ============================================================================ #
#
#
# ---------------------------------------------------------------------------- #

# AK_CXX_GNU_UNIQUE([ACTION-IF-UNIQUE], [ACTION-IF-COMMON])
# -----------------
# Detect if `libstdc++.so' has GNU Unique Object feature enabled.
AC_DEFUN([AK_CXX_GNU_UNIQUE],
[AC_REQUIRE([AK_PROG_NM])
AC_REQUIRE([AC_PROG_CXX])
AC_REQUIRE([AC_PROG_GREP])
AC_MSG_CHECKING([locating libstdc++.so])
_ak_gu_libcxx="`$CC -print-file-name=libstdc++.so`"
AC_MSG_RESULT([$_ak_gu_libcxx])
AC_MSG_CHECKING([whether libstdc++.so supports GNU Unique Object])
AS_IF([$NM --defined-only -gCDP $_ak_gu_libcxx|$GREP -q '::_S_empty_rep_storage u '],
      [ak_cxx_gnu_unique_ok=yes],
      [ak_cxx_gnu_unique_ok=no])
AC_MSG_RESULT([$ak_cxx_gnu_unique_ok])
AS_VAR_IF([ak_cxx_gnu_unique_ok], [yes],
  [m4_default([$1], [AC_DEFINE([HAVE_GNU_UNIQUE_OBJECT], [1],
                               [Define 1 if libstdc++.so supports GNU ]
                               [Unique Object.])])],
  [$2])
])# AK_CXX_GNU_UNIQUE



# ---------------------------------------------------------------------------- #


# ============================================================================ #
# vim: set filetype=config :
