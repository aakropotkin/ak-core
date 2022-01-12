# -*- mode: autoconf; -*-
# ============================================================================ #
#
#
# ---------------------------------------------------------------------------- #

# ELF_GET_SECTIONS(FILE)
# ----------------------
m4_define([ELF_GET_SECTIONS],
[[readelf -SW $1|grep '\[[ a-f0-9]\+\] \.'|tr -s '[] ' ' ']dnl
[|sed -e 's/^ //' -e 's/ @S|@//' -e 's/\([0-9]\+ \.[^ ]* [^ ]*\) .*@S|@/\1/']dnl
])# ELF_GET_SECTIONS


# ---------------------------------------------------------------------------- #

# ELF_GET_SECTION_NAMES(FILE)
# ---------------------------
m4_define([ELF_GET_SECTION_NAMES],
[ELF_GET_SECTIONS([$1])|cut -d' ' -f2[]dnl
])# ELF_GET_SECTION_NAMES


# ---------------------------------------------------------------------------- #

# ELF_HAS_SECTION(FILE, NAME)
# ---------------------------
m4_define([ELF_HAS_SECTION],
[ELF_GET_SECTION_NAMES([$1])|grep -qi '^$2@S|@'[]dnl
])# ELF_HAS_SECTION


# ---------------------------------------------------------------------------- #

# ELF_HAS_COMMENT_SECTION(FILE)
# -----------------------------
m4_define([ELF_HAS_COMMENT_SECTION],
[ELF_HAS_SECTION([$1], [\.comment])[]dnl
])# ELF_HAS_COMMENT_SECTION


# ---------------------------------------------------------------------------- #

# ELF_HAS_GCC_FLAGS_SECTION(FILE)
# -------------------------------
m4_define([ELF_HAS_GCC_FLAGS_SECTION],
[ELF_HAS_SECTION([$1], [\.GCC\.command\.line])[]dnl
])# ELF_HAS_COMMENT_SECTION


# ---------------------------------------------------------------------------- #

# ELF_GET_SECTION_STRINGS(FILE, SECTION)
# --------------------------------------
m4_define([ELF_GET_SECTION_STRINGS],
[[readelf -W -p $2 $1 2>/dev/null|grep '\[[ 0-9]\+\] ']dnl
[|sed 's/^[[:space:]]*\[[ a-f0-9]\+\] //']dnl
])# ELF_GET_SECTION_STRINGS


# ---------------------------------------------------------------------------- #

# ELF_GET_COMMENT_SECTION(FILE)
# -----------------------------
m4_define([ELF_GET_COMMENT_SECTION],
[ELF_GET_SECTION_STRINGS([$1], [\.comment])[]dnl
|sed -e 's/^ *//' -e 's/ *@S|@//'[]dnl
])# ELF_GET_COMMENT_SECTION


# ---------------------------------------------------------------------------- #

dnl m4_divert
dnl ELF_GET_SECTION_STRINGS([libfoo.so], [\.comment])
dnl ELF_GET_COMMENT_SECTION([libfoo.so])
dnl m4_divert(KILL)


# ---------------------------------------------------------------------------- #



# ============================================================================ #
# vim: set filetype=config :
