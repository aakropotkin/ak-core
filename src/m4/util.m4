# `tr' expression to split a colon separated path to lines.
m4_define([UTIL_TR_PATH_LINES], [tr ':' '\n'])

# `tr' expression to split line separated paths to colon separated.
m4_define([UTIL_TR_PATH_UNLINES], [tr '\n' ':'])


# Test if file exists.
m4_define([UTIL_TEST_E], [test -e $1[]])

# Assert file exists.
m4_define([UTIL_ASSERT_E],
[AS_IF([UTIL_TEST_E([$1])], [], [AS_ERROR([File does not exist: $1])])])
