# -*- mode: autoconf; -*-
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
  [AS_IF([UTIL_TEST_NE([$1])], [AS_ERROR([File does not exist: $1], 2)])])


# ---------------------------------------------------------------------------- #

# Use `expr' to test a regex match. Suppress output.
m4_define([UTIL_TEST_EXPR_RE], [expr "$1" : $2 1>/dev/null 2>&1])


# ---------------------------------------------------------------------------- #


# Factorial ( x! ) =
#   0 --> 1
#   1 --> 1
#   n --> n * ( ( n - 1 )! )
m4_define([UTIL_FACTORIAL],
[m4_case([$1],
         [0], [1],
         [1], [1],
         [2], [2],
         [3], [6],
         [m4_eval( 1 m4_for([x], [2], [$1], [1], [m4_echo(* x )]) )])dnl
])# UTIL_FACTORIAL


# ---------------------------------------------------------------------------- #

# C( n, r ) = ( n! ) / ( ( r! ) * ( ( n - r )! ) )
m4_define([UTIL_COMBINATION], [])

# P( n, r ) = ( n! ) / ( ( n - r ) ! )
m4_define([UTIL_PERMUTATION], [])


# ---------------------------------------------------------------------------- #



# ============================================================================ #
# vim: set filetype=config :
