# ============================================================================ #

# `tr' expression to split a colon separated path to lines.
m4_define([UTIL_TR_PATH_LINES], [tr ':' '\n'])

# `tr' expression to split line separated paths to colon separated.
m4_define([UTIL_TR_PATH_UNLINES], [tr '\n' ':'])


# ---------------------------------------------------------------------------- #

# Test if file exists.
m4_define([UTIL_TEST_E], [test -e $1[]])
#
# Test if file does not exists.
m4_define([UTIL_TEST_NE], [test ! -e $1[]])


# ---------------------------------------------------------------------------- #

# Assert file exists.
m4_define([UTIL_ASSERT_E],
[AS_IF([UTIL_TEST_NE([$1])], [AS_ERROR([File does not exist: $1])])])


# ---------------------------------------------------------------------------- #

# Use `expr' to test a regex match. Suppress output.
m4_define([UTIL_TEST_EXPR_RE], [expr "$1" : $2 1>/dev/null 2>&1])


# ---------------------------------------------------------------------------- #

m4_define([UTIL_REPORT_PRED], [
AS_VAR_COPY([RESULT], [$1])

# Parse `-F, --no-false' flags
AS_VAR_SET_IF([FALSE_NO_ESTATUS],
  [:],
  [AS_IF([UTIL_TEST_EXPR_RE([ ${*} ], [['.* \(-F\|--no-false\) .*']])],
         [AS_VAR_SET([FALSE_NO_ESTATUS], [true])],
         [AS_VAR_SET([FALSE_NO_ESTATUS], [false])])])
AS_VAR_IF([FALSE_NO_ESTATUS],
          [true],
          [AS_VAR_SET([FSTATUS], [0])
           AS_VAR_SET([VERBOSE], [true])],
          [AS_VAR_SET([FSTATUS], [1])])

# Parse `-v, --verbose' flags
AS_VAR_SET_IF([VERBOSE],
  [:],
  [AS_IF([UTIL_TEST_EXPR_RE([ ${*} ], [['.* \(-v\|--verbose\) .*']])],
         [AS_VAR_SET([VERBOSE], [true])],
         [AS_VAR_SET([VERBOSE], [false])])])

AS_VAR_IF([VERBOSE], [true], [AS_ECHO([$RESULT])])

AS_VAR_IF([RESULT], [true], [AS_EXIT([0])], [AS_EXIT([$FSTATUS])])

])


# ---------------------------------------------------------------------------- #



# ============================================================================ #
