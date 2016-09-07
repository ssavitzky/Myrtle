### Makefile for dotconfig
#

# We don't want to clutter up the user's home directory with symlinks, so we
# take advantage of the fact that there's already a link to Honu, and that
# we're on the same level.  At some point we may want to worry about that.

DST = $(HOME)/.config
PKG := $(notdir $(shell dirname `pwd`))
REL = ../Honu/../$(PKG)/dotconfig

#  Note that we're ignoring editor backup and .sh files.
CFGFILES = $(filter-out %.sh, $(wildcard [a-z]*[^~]))
FILES = $(shell for f in $(CFGFILES); do [ -d $$f ] || echo $$f; done)
DIRS  = $(shell for f in $(CFGFILES); do [ -d $$f ] && echo $$f; done)

.PHONY: install report-vars

### Install plain files

install:: $(FILES)
	for f in $(FILES); do (cd $(DST); ln -sf $(REL)/$$f .) done

### Install directories
#
#   Things are complicated by the fact that programs with a directory in .config
#   expect it to be a real directory, not a symlink.  So we make directories and
#   symlink the contents.  Clean up editor backup files afterward, which takes
#   care of edits in both directories (and is much simpler)

install:: $(DIRS)
	for d in $(DIRS); \
	     do ( cd $(DST) ; mkdir -p $$d ; cd $$d  			\
		; ln -sf ../$(REL)/$$d/* . ; rm -f *~  			\
		) done


### If we're using the MakeStuff package, chain in its Makefile
#	See ../Makefile for more information.
#
CHAIN = $(wildcard ../../MakeStuff/Makefile)
include $(CHAIN)

report-vars::
	@echo CFGFILES=$(CFGFILES)
	@echo FILES = $(FILES)
	@echo DIRS = $(DIRS)
	@echo CHAIN=$(CHAIN)
