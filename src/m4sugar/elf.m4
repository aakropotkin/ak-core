# -*- mode: autoconf; -*-
# ============================================================================ #
#
#
# ---------------------------------------------------------------------------- #

m4_include([util.m4])

# ELF_GET_ENTRY(FILE, FIELD])
# ---------------------------
m4_define([ELF_GET_ENTRY],
  [[readelf -dW $1|grep '($2)'|sed 's:^[^[]*\[\([^]]\+\)]$:\1:']dnl
])# ELF_GET_ENTRY

m4_define([__ELF_IS_ELF_BIN_MATCH], ['^ELF \(32\|64\)-bit LSB $1, .*'])
m4_define([_ELF_IS_ELF_BIN_MATCH],
  [__ELF_IS_ELF_BIN_MATCH([\(shared object\|executable\)])dnl
])# _ELF_IS_BIN_MATCH

m4_define([_ELF_IS_ELF_CU_MATCH], [__ELF_IS_ELF_BIN_MATCH([relocatable])])
m4_define([_ELF_IS_ELF_SO_MATCH], [__ELF_IS_ELF_BIN_MATCH([shared object])])
m4_define([_ELF_IS_ELF_EX_MATCH], [__ELF_IS_ELF_BIN_MATCH([executable])])


# _ELF_IS_ELF_FILE
# ---------------
m4_define([_ELF_IS_ELF_FILE],
  [UTIL_TEST_EXPR_RE([`file -Lb $1`], [$2])dnl
])# _ELF_IS_ELF_BIN


# ELF_IS_ELF_BIN(FILE)
# --------------------
m4_define([ELF_IS_ELF_BIN], [_ELF_IS_ELF_FILE([$1], [_ELF_IS_ELF_BIN_MATCH])])


# ELF_IS_ELF_CU(FILE)
# -------------------
m4_define([ELF_IS_ELF_CU], [_ELF_IS_ELF_FILE([$1], [_ELF_IS_ELF_CU_MATCH])])


# ELF_IS_ELF_SO(FILE)
# -------------------
m4_define([ELF_IS_ELF_SO], [_ELF_IS_ELF_FILE([$1], [_ELF_IS_ELF_SO_MATCH])])


# ---------------------------------------------------------------------------- #



# ============================================================================ #
# vim: set filetype=config :
