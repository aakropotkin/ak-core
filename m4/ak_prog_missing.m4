# -*- mode: autoconf; -*-
# ============================================================================ #
#
# @file ak_prog_missing.m4
#
# @brief Provides tests for the `automake` utility `missing`.
#
# This script is used to print helpful messages when a required program is
# not found.
#
#
# ---------------------------------------------------------------------------- #

#serial 1

# ---------------------------------------------------------------------------- #

# AK_PROG_MISSING
# ---------------
# Set `MISSING` to the path of the `missing` executable, if any.
# This should be located in the repo root's `build-aux` directory.
AC_DEFUN([AK_PROG_MISSING],
[AC_REQUIRE_AUX_FILE([missing])
AC_ARG_VAR([MISSING], [how to invoke a missing program])
AC_PATH_PROG([MISSING], [missing], [AC_MSG_ERROR([missing not found])],
             ["$PATH:${ac_aux_dir?}"])
]) # FLOX_PROG_MISSING


# ---------------------------------------------------------------------------- #


# ---------------------------------------------------------------------------- #
#
#
#
# ============================================================================ #
# vim: set filetype=config :
