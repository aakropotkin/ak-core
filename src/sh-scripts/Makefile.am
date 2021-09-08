
bin_SCRIPTS = cuts depgraph displays joinlines lorder wsmerge

# M4SH generated scripts
M4SH_TARGETS =  needs rpath soname
bin_SCRIPTS  += $(M4SH_TARGETS)
CLEANFILES   =  $(M4SH_TARGETS)

SUBDIRS = test

M4SUGAR_DIR = $(top_srcdir)/src/m4sugar

AUTOM4TE_FLAGS = -I$(M4SUGAR_DIR) -l m4sh


$(M4SH_TARGETS) is-elf-cu: %: %.m4sh
	$(AUTOM4TE) $(AUTOM4TE_FLAGS) -o $@ $<

$(M4SH_TARGETS): $(addprefix $(M4SUGAR_DIR)/,elf.m4 util.m4)
is-elf-cu: $(M4SUGAR_DIR)/pred-scripts.m4
