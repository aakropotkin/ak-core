m4_define([PS_TEST_YES], [test "$1" = yes ||  eval "test \"\${$1}\" = yes"])
m4_define([PS_TEST_NO], [test "$1" = no || eval "test \"\${$1}\" = no"])
m4_define([PS_IF_YES], [AS_IF([PS_TEST_YES([$1])], [$2], [$3])])
m4_define([PS_IF_NO], [AS_IF([PS_TEST_NO([$1])], [$2], [$3])])

m4_define([_m4_divert(DEFAULTS)],        10)
m4_define([_m4_divert(PARSE_ARGS)],      20)

m4_define([_m4_divert(HELP_BEGIN)],     100)
m4_define([_m4_divert(HELP_CANON)],     101)
m4_define([_m4_divert(HELP_ENABLE)],    102)
m4_define([_m4_divert(HELP_WITH)],      103)
m4_define([_m4_divert(HELP_VAR)],       104)
m4_define([_m4_divert(HELP_VAR_END)],   105)
m4_define([_m4_divert(HELP_END)],       106)

m4_define([_m4_divert(VERSION_BEGIN)],  200)
m4_define([_m4_divert(VERSION_FSF)],    201)
m4_define([_m4_divert(VERSION_USER)],   202)
m4_define([_m4_divert(VERSION_END)],    203)