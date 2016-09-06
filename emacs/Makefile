### depends.make for Honu/emacs
#

### Prevent make push (MakeStuff) from trying to push subdirs.

GITDIRS :=

.PHONY: install

### Install target
#
install:: | $(HOME)/emacs

$(HOME)/emacs: | $(HOME)/Honu
	cd $(HOME); ln -snf Honu/emacs .

### Leaving these in as an example; add to install prerequisites if you want 'em.

# was originally  git://github.com/hober/ljupdate.git, but the fork is
# more recent.
ljupdate:
	git clone git@github.com:blipvert/ljupdate.git
	(cd ljupdate; yes | make fetch compile)

# This used to be shipped with Ubuntu, but went missing in 2015 or so.
html-helper-mode:
	git clone  https://github.com/emacsattic/html-helper-mode

### If we're using the Tools package, chain in its Makefile
#	See ../Makefile for more information about Tools.
#
CHAIN = $(wildcard ../../MakeStuff/Makefile ../../../MakeStuff/Makefile)
include $(CHAIN)

report-vars::
	@echo CHAIN=$(CHAIN)
