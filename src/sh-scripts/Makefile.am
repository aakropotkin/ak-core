
bin_SCRIPTS = cuts depgraph displays joinlines lorder wsmerge

# M4SH generated scripts
M4SH_SCRIPTS =  needs rpath soname
bin_SCRIPTS  += $(M4SH_SCRIPTS)
CLEANFILES   =  $(M4SH_SCRIPTS)

M4SUGAR_DIR = -I$(top_srcdir)/src/m4sugar

AUTOM4TE_FLAGS = -I$(M4SUGAR_DIR) -l m4sh


$(M4SH_SCRIPTS): %: %.m4sh
	$(AUTOM4TE) $(AUTOM4TE_FLAGS) -o $@ $<


$(M4SH_SCRIPTS): $(M4SUGAR_DIR)/elf.m4
