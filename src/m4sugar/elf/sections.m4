# -*- mode: autoconf; -*-
# ============================================================================ #
#
#
# ---------------------------------------------------------------------------- #

# ELF_GET_SECTIONS(FILE)
# ----------------------
m4_define([ELF_GET_SECTIONS],
[[readelf -SW $1|grep '\[[ 0-9]\+\] \.'|tr -s '[] ' ' ']dnl
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
[ELF_GET_SECTION_NAMES([$1])|grep -qi '^\.\?$2@S|@'[]dnl
])# ELF_HAS_SECTION


# ---------------------------------------------------------------------------- #

# ELF_HAS_COMMENT_SECTION(FILE)
# -----------------------------
m4_define([ELF_HAS_COMMENT_SECTION],
[ELF_HAS_SECTION([$1], [comment])[]dnl
])# ELF_HAS_COMMENT_SECTION


# ---------------------------------------------------------------------------- #

# ELF_HAS_GCC_FLAGS_SECTION(FILE)
# -------------------------------
m4_define([ELF_HAS_GCC_FLAGS_SECTION],
[ELF_HAS_SECTION([$1], [GCC\.command\.line])[]dnl
])# ELF_HAS_COMMENT_SECTION


# ---------------------------------------------------------------------------- #



# ============================================================================ #
# vim: set filetype=config :
