### Makefile for Myrtle
#
# Targets:
#	install
#	install-pkgs
#	report-vars
#

# Which subdirectories have an install target?
makeable := $(shell for f in *; do [ -e $$f/Makefile ] && echo $$f; done)
INSTALL_DIRS := $(shell for f in $(makeable); do grep -sq install:: $$f/Makefile	\
						 && echo $$f; done)

###

.PHONY: install install-pkgs report-vars

install::
	for d in $(INSTALL_DIRS); do (cd $$d; $(MAKE) install) done

install-pkgs::
	cd setup; for f in *pkgs; do ./$$f; done

### If we're using the MakeStuff package, chain in its Makefile
#	This is optional -- it doesn't affect basic functionality -- but it
#	brings in a lot of useful extras like "make push", recursive "make all",
#	and so on.  Note that include does the right thing if the file list is
#	empty, so we don't have to test for that.
#
#	Normally Makefile is a symlink to Makestuff/Makefile, and local
#	dependencies go into depends.make.  We do it differently here because
#	we might not have MakeStuff downloaded yet.
#
CHAIN = $(wildcard ../MakeStuff/Makefile)
include $(CHAIN)

### report-vars
#	report-vars is also defined in the Tools package, so you can use it to
#	see whether Tools/Makefile is properly chained in.
report-vars::
	@echo makeable= $(makeable)
	@echo INSTALL_DIRS= $(INSTALL_DIRS)
	@echo CHAIN=$(CHAIN)
