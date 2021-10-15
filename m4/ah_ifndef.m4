# -*- mode: autoconf; -*-
# ============================================================================ #
#
#
# ---------------------------------------------------------------------------- #

#serial 1

# ---------------------------------------------------------------------------- #

# _AH_IFNDEF_VAR(VARIABLE, NDEF-VARIABLE, DESCRIPTION)
AC_DEFUN([_AH_IFNDEF_VAR],
[AH_VERBATIM([$1],
m4_expand([$3])[@%:@ifndef ]m4_expand([$2])[
@%:@  undef ]m4_expand([$1])[
@%:@endif])
])


# AH_IFNDEF_VAR(VARIABLE, [NDEF-VARIABLE], [DESCRIPTION])
AC_DEFUN([AH_IFNDEF_VAR],
[m4_case([$#],
         [1], [_AH_IFNDEF_VAR([$1], [$1], [])],
         [2], [_AH_IFNDEF_VAR([$1], [$2], [])],
         [3], [_AH_IFNDEF_VAR([$1], [$2], [/* $3 */[]m4_newline])],
         [m4_fatal([$0: Wrong number of arguments])])
])



# ---------------------------------------------------------------------------- #

# _AH_IFDEF_VAR(VARIABLE, NDEF-VARIABLE, DESCRIPTION)
AC_DEFUN([_AH_IFDEF_VAR],
[AH_VERBATIM([$1],
m4_expand([$3])[@%:@ifdef ]m4_expand([$2])[
@%:@  undef ]m4_expand([$1])[
@%:@endif])
])


# AH_IFDEF_VAR(VARIABLE, [NDEF-VARIABLE], [DESCRIPTION])
AC_DEFUN([AH_IFDEF_VAR],
[m4_case([$#],
         [1], [_AH_IFDEF_VAR([$1], [$1], [])],
         [2], [_AH_IFDEF_VAR([$1], [$2], [])],
         [3], [_AH_IFDEF_VAR([$1], [$2], [/* $3 */[]m4_newline])],
         [m4_fatal([$0: Wrong number of arguments])])
])



# ---------------------------------------------------------------------------- #

# _AH_IF_VAR(VARIABLE, CPP-TEST, DESCRIPTION)
AC_DEFUN([_AH_IF_VAR],
[AH_VERBATIM([$1],
m4_expand([$3])[@%:@if ]m4_expand([$2])[
@%:@  undef ]m4_expand([$1])[
@%:@endif])
])


# AH_IF_VAR(VARIABLE, CPP-TEST, [DESCRIPTION])
AC_DEFUN([AH_IF_VAR],
[m4_case([$#],
         [2], [_AH_IF_VAR([$1], [$2], [])],
         [3], [_AH_IF_VAR([$1], [$2], [/* $3 */[]m4_newline])],
         [m4_fatal([$0: Wrong number of arguments])])
])


# ---------------------------------------------------------------------------- #



# ============================================================================ #
# vim: set filetype=config :
