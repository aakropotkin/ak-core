# tr expression to split a colon separated path to lines.
m4_defun([UTIL_TR_PATH_LINES], [tr ':' '\n'])

# tr expression to split line separated paths to colon separated.
m4_defun([UTIL_TR_PATH_UNLINES], [tr '\n' ':'])
