# -*- mode: m4; -*-
# ============================================================================ #
#
#
# ---------------------------------------------------------------------------- #

m4_define([PS_TEST_TRUE], [test "$1" = true ||  eval "test \"\${$1}\" = true"])
m4_define([PS_TEST_FALSE], [test "$1" = false || eval "test \"\${$1}\" = false"])
m4_define([PS_IF_TRUE], [AS_IF([PS_TEST_TRUE([$1])], [$2], [$3])])
m4_define([PS_IF_FALSE], [AS_IF([PS_TEST_FALSE([$1])], [$2], [$3])])


# ---------------------------------------------------------------------------- #

m4_define([_m4_divert(DEFAULTS)],          10)
m4_define([_m4_divert(PARSE_ARGS)],        20)

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
}

m4_divert_pop([HELP_END])dnl
])# _PS_INIT_HELP


# ---------------------------------------------------------------------------- #

# _PS_INIT_ARGS
# -------------
m4_define([_PS_INIT_ARGS],
[])# _PS_INIT_ARGS


# ---------------------------------------------------------------------------- #

# _PS_STRIP_COLONS(STRING)
# ------------------------
m4_define([_PS_STRIP_COLONS],
[m4_bpatsubst([$1], [:], [])[]dnl
])# _PS_STRIP_COLONS


# ---------------------------------------------------------------------------- #

# _PS_GETOPT_GEN_NAME(LENGTH, OPTARG)
# -----------------------------------
# Strip colons from end of option.
m4_define([_PS_GETOPT_GEN_NAME],
[_PS_GETOPT_[]$1[]__[]_PS_STRIP_COLONS([$2])dnl
])# _PS_GETOPT_GEN_NAME


# ---------------------------------------------------------------------------- #

# _PS_GET_GETOPT_LONG_FULL(OPTARG)
# --------------------------------
# Get `getopt' long argument with its `:' suffix.
m4_define([_PS_GET_GETOPT_LONG_FULL],
_PS_GETOPT_GEN_NAME([LONG], [$1])dnl
)# _PS_GET_GETOPT_LONG_FULL


# _PS_GET_GETOPT_SHORT_FULL(OPTARG)
# ---------------------------------
# Get `getopt' short argument with its `:' suffix.
m4_define([_PS_GET_GETOPT_SHORT_FULL],
_PS_GETOPT_GEN_NAME([SHORT], [$1])dnl
)# _PS_GET_GETOPT_SHORT_FULL


# ---------------------------------------------------------------------------- #

# _PS_SET_GETOPT_LONG_FULL(OPTARG)
# --------------------------------
# Set `getopt' long argument with its `:' suffix.
m4_define([_PS_SET_GETOPT_LONG_FULL],
[m4_define(_PS_GETOPT_GEN_NAME([LONG], [$1]), [$1])dnl
])# _PS_GET_GETOPT_LONG_FULL


# _PS_SET_GETOPT_SHORT_FULL(OPTARG)
# ---------------------------------
# Set `getopt' short argument with its `:' suffix.
m4_define([_PS_SET_GETOPT_SHORT_FULL],
[m4_define(_PS_GETOPT_GEN_NAME([SHORT], [$1]), [$1])dnl
])# _PS_GET_GETOPT_SHORT_FULL


# ---------------------------------------------------------------------------- #

# _PS_GETOPT_LONG_OPTS_APPEND(OPTARG)
# -----------------------------------
# Appends `getopt' long option to collection.
# If this option already exists its argument suffix may be updated.
m4_define([_PS_GETOPT_LONG_OPTS_APPEND],
[m4_set_add([_PS_GETOPT_LONG_OPTS], _PS_STRIP_COLONS([$1]))dnl
_PS_SET_GETOPT_LONG_FULL([$1])dnl
])# _PS_GETOPT_LONG_OPTS_APPEND


# _PS_GETOPT_SHORT_OPTS_APPEND(OPTARG)
# ------------------------------------
# Appends `getopt' short option to collection.
# If this option already exists its argument suffix may be updated.
m4_define([_PS_GETOPT_SHORT_OPTS_APPEND],
[m4_set_add([_PS_GETOPT_SHORT_OPTS], _PS_STRIP_COLONS([$1]))dnl
_PS_SET_GETOPT_SHORT_FULL([$1])dnl
])# _PS_GETOPT_LONG_OPTS_APPEND


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
[_PS_GETOPT_SHORT_OPTS_APPEND([$1[]$3])dnl
_PS_GETOPT_LONG_OPTS_APPEND([$2[]$3])dnl
m4_divert_push([HELP_OPTS])dnl
PS_HELP_OPTS_DEF([$1], [$2], [$3], [$4])dnl
m4_divert_pop([HELP_OPTS])dnl
])# _PS_GETOPT_OPTS_DEF


# ---------------------------------------------------------------------------- #

# _PS_GETOPT_FLAGS
# ----------------
# Generate `getopt' command for script to evaluate.
m4_define([_PS_GETOPT_FLAGS],
[getopt -n $as_me -l []dnl
m4_set_map_sep([_PS_GETOPT_LONG_OPTS],
               [_PS_GET_GETOPT_LONG_FULL(],
               [)],
               [,])dnl
 -o []dnl
m4_set_map_sep([_PS_GETOPT_SHORT_OPTS],
               [_PS_GET_GETOPT_SHORT_FULL(],
               [)])dnl
 -- $[]@dnl
])# _PS_GETOPT_FLAGS


# ---------------------------------------------------------------------------- #

# _PS_INIT_DEFAULTS
# -----------------
m4_define([_PS_INIT_DEFAULTS],
[m4_divert_push([DEFAULTS])dnl
m4_text_box([Predicate Script initialization.])

ps_verbose=false
ps_help=false
ps_suppress_false_status=false

ps_opts='
ps_verbose
ps_help
ps_suppress_false_status'

ps_user_opts='
m4_ifdef([_PS_USER_OPTS], [m4_defn([_PS_USER_OPTS])
])'
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

m4_pattern_forbid([^_?PS_])
m4_divert_pop([KILL])dnl
m4_provide([PS_INIT])dnl
])# PS_INIT


# ---------------------------------------------------------------------------- #



# ============================================================================ #
# vim: set filetype=config :
