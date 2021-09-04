
.DEFAULT_GOAL = all
.PHONY: all clean

TOP = $(patsubst %/,%,$(dir $(abspath $(firstword $(MAKEFILE_LIST)))))

SRCDIR = $(TOP)/src

M4SHDIR = $(SRCDIR)/m4

SCRIPTDIRS =  awk-scripts sh-scripts zsh-scripts
SCRIPTDIRS := $(addprefix $(SRCDIR)/,$(SCRIPTDIRS))

AWK_SCRIPTS = dedup
SRC_AWK_SCRIPTS := $(addprefix $(SRCDIR)/awk-scripts/,$(AWK_SCRIPTS))

SH_SCRIPTS  = cuts displays joinlines wsmerge lorder depgraph
SRC_SH_SCRIPTS := $(addprefix $(SRCDIR)/sh-scripts/,$(SH_SCRIPTS))

M4SH_SCRIPTS = needs soname rpath
SRC_M4SH_SCRIPTS := $(addprefix $(SRCDIR)/sh-scripts/,$(M4SH_SCRIPTS))
SRC_M4SH_DEFS := $(addsuffix .m4sh,$(SRC_M4SH_SCRIPTS))

ZSH_SCRIPTS = is-elf-ar is-elf-cu is-elf-so scomm syms
SRC_ZSH_SCRIPTS := $(addprefix $(SRCDIR)/zsh-scripts/,$(ZSH_SCRIPTS))

ALL_SCRIPTS := $(AWK_SCRIPTS) $(SH_SCRIPTS) $(M4SH_SCRIPTS) $(ZSH_SCRIPTS)
SRC_ALL_SCRIPTS := $(SRC_AWK_SCRIPTS) $(SRC_SH_SCRIPTS) $(SRC_ZSH_SCRIPTS)
SRC_ALL_SCRIPTS += $(SRC_M4SH_SCRIPTS)

OUTDIR = $(TOP)/output
BINDIR = $(OUTDIR)/bin

OUT_SCRIPTS := $(addprefix $(BINDIR)/,$(ALL_SCRIPTS))

$(BINDIR):
	mkdir -p $@

$(OUT_SCRIPTS): | $(BINDIR)

$(SRC_M4SH_SCRIPTS): %: %.m4sh $(M4SHDIR)
	autom4te -l M4sh -I$(M4SHDIR) -o $@ $<

$(M4DIR)/elf.m4: $(M4DIR)/util.m4

$(addprefix $(SRCDIR)/sh-scripts/,needs soname rpath): $(M4SHDIR)/elf.m4

$(addprefix $(BINDIR)/,$(AWK_SCRIPTS)):  $(BINDIR)/%: $(SRCDIR)/awk-scripts/%
$(addprefix $(BINDIR)/,$(SH_SCRIPTS)):   $(BINDIR)/%: $(SRCDIR)/sh-scripts/%
$(addprefix $(BINDIR)/,$(M4SH_SCRIPTS)): $(BINDIR)/%: $(SRCDIR)/sh-scripts/%
$(addprefix $(BINDIR)/,$(ZSH_SCRIPTS)):  $(BINDIR)/%: $(SRCDIR)/zsh-scripts/%

$(OUT_SCRIPTS):
	install -t $(BINDIR) $<

all: $(SRC_ALL_SCRIPTS)

clean:
	-rm -rf $(OUTDIR)
	-rm -f $(SRC_M4SH_SCRIPTS) $(addsuffix ~,$(SRC_M4SH_SCRIPTS))

install: $(OUT_SCRIPTS)
