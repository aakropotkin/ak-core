# -*- mode: autoconf; -*-
# ============================================================================ #
#
#
# ---------------------------------------------------------------------------- #

m4_define([_m4_divert(DEFAULTS)], 10)

m4_define([_m4_divert(GETOPT_BEGIN)],       15)
m4_define([_m4_divert(GETOPT_LONG_OPTS)],   16)
m4_define([_m4_divert(GETOPT_SHORT_OPTS)],  17)
m4_define([_m4_divert(GETOPT_END)],         18)
m4_define([_m4_divert(PARSE_GETOPT_BEGIN)], 21)
m4_define([_m4_divert(PARSE_GETOPT_CASES)], 22)
m4_define([_m4_divert(PARSE_GETOPT_END)],   23)
m4_define([_m4_divert(PARSE_EXTRA)],        24)

m4_define([_m4_divert(HELP_BEGIN)],     100)
m4_define([_m4_divert(HELP_USAGE_LN)],  101)
m4_define([_m4_divert(HELP_SUMMARY)],   102)
m4_define([_m4_divert(HELP_OPTS)],      103)
m4_define([_m4_divert(HELP_END)],       106)

#m4_define([_m4_divert(VERSION_BEGIN)],  200)
#m4_define([_m4_divert(VERSION_FSF)],    201)
#m4_define([_m4_divert(VERSION_USER)],   202)
#m4_define([_m4_divert(VERSION_END)],    203)


# ---------------------------------------------------------------------------- #

# _PS_INIT_HELP
# -------------
m4_define([_PS_INIT_HELP],
[m4_divert_push([HELP_BEGIN])dnl

function usage() {
  echo "\
USAGE: $as_me

m4_divert_pop([HELP_BEGIN])dnl
m4_divert_push([HELP_END])dnl
dnl Close MESSAGE string.
"
  AS_EXIT([${1:-2}])
}

m4_divert_pop([HELP_END])dnl
])# _PS_INIT_HELP


# ---------------------------------------------------------------------------- #

# _PS_INIT_GETOPT
# ---------------
m4_define([_PS_INIT_GETOPT],
[m4_divert_push([GETOPT_BEGIN])dnl
_ps_getopt_OPTIONS="`getopt -n $as_me []dnl
m4_divert_pop([GETOPT_BEGIN])dnl
m4_divert_push([GETOPT_LONG_OPTS])dnl
-l []dnl
m4_divert_pop([GETOPT_LONG_OPTS])dnl
m4_divert_push([GETOPT_SHORT_OPTS])dnl
 -o []dnl
m4_divert_pop([GETOPT_SHORT_OPTS])dnl
m4_divert_push([GETOPT_END])dnl
 -- $[]@`"
_ps_getopt_OPTIONS_RSL=${?}
AS_VAR_IF([_ps_getopt_OPTIONS_RSL], [0], [],
  [AS_ERROR([getopt failed to parse: error code $_ps_getopt_OPTIONS_RSL], [2])])
eval set -- "$_ps_getopt_OPTIONS"
m4_divert_pop([GETOPT_END])dnl
])


# ---------------------------------------------------------------------------- #
# _PS_INIT_PARSE_GETOPT
# ---------------------
m4_define([_PS_INIT_PARSE_GETOPT],
[m4_divert_push([PARSE_GETOPT_BEGIN])
while :
do
  case "${1}" in
m4_divert_pop([PARSE_GETOPT_BEGIN])dnl
dnl
m4_divert_push([PARSE_GETOPT_END])dnl
    --)
      shift
      break
      ;;
    *)
      AS_ERROR([Unexpected option: ${1}], 2)
      ;;
   esac
   shift;
done
m4_divert_pop([PARSE_GETOPT_END])dnl
])# _PS_INIT_PARSE_GETOPT


# ---------------------------------------------------------------------------- #

# _PS_HELP_OPTS_DEF(SHORTOPT, LONGOPT, OPT_SUFFIX, HELP_MESSAGE)
# --------------------------------------------------------------
m4_define([_PS_HELP_OPTS_DEF],
[m4_case([$#],
         [3], [AS_HELP_STRING([-$1, --$2], [$3])],
         [4], [AS_HELP_STRING([-$1 $4, --$2[]$4], [$3])],
         [[m4_fatal([$0: too few arguments: $#])]])
])# _PS_HELP_OPTS_DEF


# PS_HELP_OPTS_DEF(SHORTOPT, LONGOPT, OPT_SUFFIX, OPT_SUFFIX)
# -----------------------------------------------------------
m4_define([PS_HELP_OPTS_DEF],
[m4_case([$3],
         [],   [_PS_HELP_OPTS_DEF($1, $2, $4)],
         [:],  [_PS_HELP_OPTS_DEF($1, $2, $4, ARG)]
         [::], [_PS_HELP_OPTS_DEF($1, $2, $4, [[=ARG]])],
         [m4_fatal([$0: Unrecognized option argument type: $4])])dnl
])# PS_HELP_OPTS_DEF


# ---------------------------------------------------------------------------- #

# PS_GETOPT_OPTS_DEF(SHORT, LONG, OPT_SUFFIX)
# -------------------------------------------
# User interface for defining commands.
#
# Ex : Define flags `-f' and `--foo' with mandatory argument.
#   PS_GETOPT_OPTS_DEF([f], [foo], [:])
#
m4_define([PS_GETOPT_OPTS_DEF],
[m4_divert_push([HELP_OPTS])dnl
PS_HELP_OPTS_DEF([$1], [$2], [$3], [$4])dnl
m4_divert_pop([HELP_OPTS])dnl
dnl
m4_divert_push([PARSE_GETOPT_CASES])dnl
    -$1|--$2)
      m4_case([$3],
              [],   [opt_[]AS_TR_SH([$2])=yes],
              [:],  [{ shift; opt_[]AS_TR_SH([$2])="$[]1"; }],
              [::], [{ shift; opt_[]AS_TR_SH([$2])="${1:-__OPT_EMPTY__}"; }],
              [[m4_fatal([$0: unrecognized option suffix: $3])]])
      ;;
m4_divert_pop([PARSE_GETOPT_CASES])dnl
m4_divert_push([GETOPT_LONG_OPTS])dnl
$2[]$3,[]dnl
m4_divert_pop([GETOPT_LONG_OPTS])dnl
m4_divert_push([GETOPT_SHORT_OPTS])dnl
$1[]$3[]dnl
m4_divert_pop([GETOPT_SHORT_OPTS])dnl
])# _PS_GETOPT_OPTS_DEF


# ---------------------------------------------------------------------------- #

# _PS_INIT_DEFAULTS
# -----------------
m4_define([_PS_INIT_DEFAULTS],
[m4_divert_push([DEFAULTS])dnl
m4_text_box([Predicate Script initialization.])

opt_verbose=no
opt_help=no
opt_no_false=no

m4_divert_pop([DEFAULTS])dnl
])# _PS_INIT_DEFAULTS


# ---------------------------------------------------------------------------- #

# PS_INIT
# -------
m4_define([PS_INIT],
[AS_INIT[]dnl
m4_divert_push([KILL])

_PS_INIT_DEFAULTS
_PS_INIT_HELP
_PS_INIT_GETOPT
_PS_INIT_PARSE_GETOPT

PS_GETOPT_OPTS_DEF([v], [verbose],  [], [Be verbose])dnl
PS_GETOPT_OPTS_DEF([F], [no-false], [], [Do not return failure for false])dnl
PS_GETOPT_OPTS_DEF([h], [help],     [], [Print this usage message])dnl

m4_pattern_forbid([^_?PS_])
m4_divert_pop([KILL])dnl
m4_provide([PS_INIT])dnl
])# PS_INIT


# ---------------------------------------------------------------------------- #

m4_define([PS_REPORT_BOOL],
[AS_VAR_COPY([_ps_RESULT], [$1])
AS_VAR_IF([opt_no_false], [yes],
          [_ps_fail_status=0
           opt_verbose=yes],
          [_ps_fail_status=1])
AS_VAR_IF([opt_verbose], [yes], [AS_ECHO([$_ps_RESULT])])
AS_VAR_IF([_ps_RESULT], [yes], [AS_EXIT([0])], [AS_EXIT([$_ps_fail_status])])
])


# ---------------------------------------------------------------------------- #



# ============================================================================ #
# vim: set filetype=config :
