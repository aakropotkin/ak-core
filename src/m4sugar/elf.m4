# -*- mode: autoconf; -*-
# ============================================================================ #
#
#
# ---------------------------------------------------------------------------- #

m4_include([util.m4])
m4_include([pred-scripts.m4])


# ---------------------------------------------------------------------------- #

# ELF_GET_ENTRY(FILE, FIELD])
# ---------------------------
m4_define([ELF_GET_ENTRY],
  [[readelf -dW $1|grep '($2)'|sed 's:^[^[]*\[\([^]]\+\)]$:\1:']dnl
])# ELF_GET_ENTRY

m4_define([_ELF_IS_ELF_RE], ['^ELF \(32\|64\)-bit LSB $1, .*'])
m4_define([_ELF_BIN_MATCH], [_ELF_IS_ELF_RE([\(shared object\|executable\)])])
m4_define([_ELF_CU_MATCH],  [_ELF_IS_ELF_RE([relocatable])])
m4_define([_ELF_SO_MATCH],  [_ELF_IS_ELF_RE([shared object])])
m4_define([_ELF_EX_MATCH],  [_ELF_IS_ELF_RE([executable])])

m4_define([_ELF_IS_ELF_FILE], [UTIL_TEST_EXPR_RE([`file -Lb $1`], [$2])])

m4_define([ELF_IS_ELF_BIN], [_ELF_IS_ELF_FILE([$1], [_ELF_BIN_MATCH])])
m4_define([ELF_IS_ELF_CU], [_ELF_IS_ELF_FILE([$1], [_ELF_CU_MATCH])])
m4_define([ELF_IS_ELF_SO], [_ELF_IS_ELF_FILE([$1], [_ELF_SO_MATCH])])


# ---------------------------------------------------------------------------- #

# IS_ELF_INIT(KIND, SUMMARY)
# --------------------------
m4_defun([IS_ELF_INIT],
[PS_INIT[]dnl
m4_divert_text([HELP_SUMMARY], [$2])
AS_VAR_COPY([TARGET], [1])
shift
UTIL_ASSERT_E([$TARGET])
AS_IF([$1([$TARGET])], [PS_REPORT_BOOL([yes])], [PS_REPORT_BOOL([no])])
])# IS_ELF_INIT



# ---------------------------------------------------------------------------- #



# ============================================================================ #
# vim: set filetype=config :
