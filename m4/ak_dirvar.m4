# -*- mode: autoconf -*-
# ============================================================================ #
#
# Define directory variables relative to `prefix' as `prel_<NAME>dir'.
# This allows `automake' to generate custom install paths that follow the FSH
# pattern requested by users.
#
# This is particularly useful for staging and packaging sub-modules or sub-sets
# of targets without using recursion.
#
#
# ============================================================================ #

m4_define([_AK_DIRVAR_DIRS],
  [prefix exec_prefix bindir sbindir libexecdir datarootdir datadir sysconfdir
  sharedstatedir localstatedir runstatedir includedir oldincludedir docdir
  infodir htmldir dvidir pdfdir psdir libdir lispdir localedir mandir man1dir
  man2dir man3dir man4dir man5dir man6dir man7dir man8dir man9dir srcdir
  builddir pkgdatadir pkgincludedir pkglibdir pkglibexecdir])


# ---------------------------------------------------------------------------- #

# _AK_DIRVAR_MK_PREL(DIRVAL)
m4_define([_AK_DIRVAR_MK_PREL],
[AS_ECHO(["$1"])|$SED []dnl
-e 's:\$[[({]]\?prefix[[})]]\?/\?::g' []dnl
-e 's:\(\$[[({]]\?\)\(m4_bpatsubst(m4_normalize(_AK_DIRVAR_DIRS),
                      [ ], [\\|])\)\([[})]]\?\):\1prel_\2\3:g'
])# _AK_DIRVAR_MK_PREL


# _AK_DIRVAR_DEF
# --------------
AC_DEFUN([_AK_DIRVAR_DEF],
[AC_REQUIRE([AC_PROG_SED])
m4_foreach_w([_ak_Dirv], _AK_DIRVAR_DIRS,
[if test ${_ak_Dirv+y}
then
  if test -z "${prel_[]_ak_Dirv}"
  then
    prel_[]_ak_Dirv=`_AK_DIRVAR_MK_PREL([$_ak_Dirv])`
  fi
  AC_SUBST(prel_[]_ak_Dirv)
fi
])
]) # _AK_DIRVAR_DEF



# ---------------------------------------------------------------------------- #

# AK_DIRVAR_INIT
# --------------
AC_DEFUN_ONCE([AK_DIRVAR_INIT],
[AC_REQUIRE([_AK_DIRVAR_DEF])
m4_pattern_forbid([^_AK_DIRVAR_])
])# AK_DIRVAR_INIT


# ---------------------------------------------------------------------------- #



# ============================================================================ #
# vim: set filetype=config :
