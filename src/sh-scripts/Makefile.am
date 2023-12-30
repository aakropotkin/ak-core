
bin_SCRIPTS =  cuts displays joinlines lorder wsmerge json-syms
bin_SCRIPTS += cdeps trim wslines cincludes ak-ifnames get-m4-path get-m4-files
bin_SCRIPTS += drop-until cdecls lines-prefix racu
bin_SCRIPTS += elf-cflags symlink-samedir-p has-programs nextlink
bin_SCRIPTS += iface_ips_json sha256dir ccjs

# M4SH generated scripts
IS_ELF_TARGETS = is-elf-cu is-elf-so is-elf-ex is-elf-bin is-elf-ar
M4SH_TARGETS =  needs rpath soname $(IS_ELF_TARGETS)
#bin_SCRIPTS  += $(M4SH_TARGETS)
bin_SCRIPTS += is-elf-cu is-elf-so is-elf-ex is-elf-bin is-elf-ar
bin_SCRIPTS += needs rpath soname
CLEANFILES   =  $(M4SH_TARGETS)

SUBDIRS = test

M4SUGAR_DIR = $(top_srcdir)/src/m4sugar

AUTOM4TE_FLAGS = -I$(M4SUGAR_DIR) -l m4sh

rpath: %: %.m4sh
	$(AUTOM4TE) $(AUTOM4TE_FLAGS) -o $@ $<

soname.in:
	echo 'm4_define([DT_ENTRY], [SONAME])' > $@
needs.in:
	echo 'm4_define([DT_ENTRY], [NEEDED])' > $@

BUILT_SOURCES =  soname.in needs.in
CLEANFILES += $(BUILT_SOURCES)

needs soname: %: dt_entry.m4sh %.in
	$(AUTOM4TE) $(AUTOM4TE_FLAGS) -o $@ $*.in $<

$(IS_ELF_TARGETS): %: is-elf-xx.m4sh
	ELF_KIND=;                                                              \
	if expr "$@" : '.*-cu*.' >/dev/null; then ELF_KIND='compilation unit';  \
	elif expr "$@" : '.*-so.*' >/dev/null; then ELF_KIND='shared object';   \
	elif expr "$@" : '.*-ex.*' >/dev/null; then ELF_KIND='executable';      \
	elif expr "$@" : '.*-ar.*' >/dev/null; then ELF_KIND='archive';         \
	elif expr "$@" : '.*-bin.*' >/dev/null; then ELF_KIND='binary'; fi;     \
	sed -e "s/@XX@/ELF_$$(basename $@|tr '[a-z]-' '[A-Z]_')/"               \
	    -e "s/@SUMMARY@/Detect if file is an ELF $$ELF_KIND./"              \
	  $(srcdir)/is-elf-xx.m4sh > $*.m4sh;                                   \
	$(AUTOM4TE) $(AUTOM4TE_FLAGS) -o $@ $*.m4sh;                            \
	rm $*.m4sh

$(M4SH_TARGETS): $(addprefix $(M4SUGAR_DIR)/,elf.m4 util.m4)
$(IS_ELF_TARGETS): $(M4SUGAR_DIR)/pred-scripts.m4

if ENABLE_SHELLCHECK
SHELLCHECK_FILES = $(bin_SCRIPTS)
SHELLCHECK_FLAGS = --shell=sh
# check-am assures that all test scripts and other resources are built.
check-local: $(SHELLCHECK_FILES)
	$(SHELLCHECK) $(SHELLCHECK_FLAGS) $(SHELLCHECK_FILES)
endif
