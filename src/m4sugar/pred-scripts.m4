
# ============================================================================ #


# ---------------------------------------------------------------------------- #

m4_define([PS_TEST_TRUE], [test "$1" = true ||  eval "test \"\${$1}\" = true"])
m4_define([PS_TEST_FALSE], [test "$1" = false || eval "test \"\${$1}\" = false"])
m4_define([PS_IF_TRUE], [AS_IF([PS_TEST_TRUE([$1])], [$2], [$3])])
m4_define([PS_IF_FALSE], [AS_IF([PS_TEST_FALSE([$1])], [$2], [$3])])


# ---------------------------------------------------------------------------- #

m4_define([_m4_divert(DEFAULTS)],          10)
m4_define([_m4_divert(PARSE_ARGS)],        20)

#m4_define([_m4_divert(HELP_BEGIN)],     100)
#m4_define([_m4_divert(HELP_CANON)],     101)
#m4_define([_m4_divert(HELP_ENABLE)],    102)
#m4_define([_m4_divert(HELP_WITH)],      103)
#m4_define([_m4_divert(HELP_VAR)],       104)
#m4_define([_m4_divert(HELP_VAR_END)],   105)
#m4_define([_m4_divert(HELP_END)],       106)

#m4_define([_m4_divert(VERSION_BEGIN)],  200)
#m4_define([_m4_divert(VERSION_FSF)],    201)
#m4_define([_m4_divert(VERSION_USER)],   202)
#m4_define([_m4_divert(VERSION_END)],    203)


# ---------------------------------------------------------------------------- #

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

m4_define([PS_INIT],
[AS_INIT[]dnl
m4_divert_push([KILL])
_PS_INIT_DEFAULTS
m4_divert_pop
m4_provide([PS_INIT])dnl
])


# ---------------------------------------------------------------------------- #



# ============================================================================ #
