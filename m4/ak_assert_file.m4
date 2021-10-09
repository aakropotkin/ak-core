# AK_ASSERT_FILE(file, [action-if-not-found = AC_MSG_FAILURE(...)])
# --------------------------------------------------------------
AC_DEFUN([AK_ASSERT_FILE],
[AC_CHECK_FILE([$1], [],
   [m4_default([$2], [AC_MSG_FAILURE([Could not find file/directory: $1])])])
])# AK_ASSERT_FILE
