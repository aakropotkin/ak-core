
bin_SCRIPTS =  cuts depgraph displays joinlines lorder wsmerge
bin_SCRIPTS += cdeps trim wslines cincludes ak-ifnames

# M4SH generated scripts
M4SH_TARGETS =  needs rpath soname
bin_SCRIPTS  += $(M4SH_TARGETS)
CLEANFILES   =  $(M4SH_TARGETS)

SUBDIRS = test

M4SUGAR_DIR = $(top_srcdir)/src/m4sugar

AUTOM4TE_FLAGS = -I$(M4SUGAR_DIR) -l m4sh

rpath is-elf-cu: %: %.m4sh
	$(AUTOM4TE) $(AUTOM4TE_FLAGS) -o $@ $<

soname.in:
	echo 'm4_define([DT_ENTRY], [SONAME])' > $@
needs.in:
	echo 'm4_define([DT_ENTRY], [NEEDED])' > $@

BUILT_SOURCES = soname.in needs.in
CLEANFILES += $(BUILT_SOURCES)

needs soname: %: dt_entry.m4sh %.in
	$(AUTOM4TE) $(AUTOM4TE_FLAGS) -o $@ $*.in $<

$(M4SH_TARGETS): $(addprefix $(M4SUGAR_DIR)/,elf.m4 util.m4)
is-elf-cu: $(M4SUGAR_DIR)/pred-scripts.m4
