
bin_SCRIPTS =  cuts depgraph displays joinlines lorder wsmerge
bin_SCRIPTS += cdeps trim wslines cincludes ak-ifnames

# M4SH generated scripts
IS_ELF_TARGETS = is-elf-cu is-elf-so is-elf-ex is-elf-bin
M4SH_TARGETS =  needs rpath soname $(IS_ELF_TARGETS)
bin_SCRIPTS  += $(M4SH_TARGETS)
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
	sed "s/@XX@/ELF_$$(basename $@|tr '[a-z]-' '[A-Z]_')/"  \
	  $(srcdir)/is-elf-xx.m4sh > $*.m4sh;                        \
	$(AUTOM4TE) $(AUTOM4TE_FLAGS) -o $@ $*.m4sh;                 \
	rm $*.m4sh

$(M4SH_TARGETS): $(addprefix $(M4SUGAR_DIR)/,elf.m4 util.m4)
$(IS_ELF_TARGETS): $(M4SUGAR_DIR)/pred-scripts.m4
