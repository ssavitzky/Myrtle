### Makefile for dotfiles
#

# We don't want to clutter up the user's home directory with symlinks, so we
# take advantage of the fact that there's already a link to Honu, and that
# we're on the same level.  At some point we may want to worry about that.

DST = $(HOME)
PKG := $(notdir $(shell dirname `pwd`))
SRC = Honu/../$(PKG)

SRCFILES := $(wildcard _*)
DOTFILES := $(shell for f in $(SRCFILES); do echo $$f| sed -e 's/_/./'; done)
DSTFILES := $(addprefix $(HOME)/, $(DOTFILES))
# These are the originals we'll have to move out of the way:
NONLINKS := $(shell for f in $(DSTFILES); do [ -L $$f ] || [ ! -e  $$f ] || echo $$f; done)

# Here's where we move any original (non-dot) files we find.
ORIGINALS = ../local/originals

.PHONY: install cleanup report-vars

### Install dotfiles in $(HOME).
#
install::
	@[ -z "$(NONLINKS)" ] || echo moving $(NONLINKS) to $(ORIGINALS)
	@for f in $(NONLINKS); do mkdir $(ORIGINALS); mv $$f $(ORIGINALS); done
	@for f in $(SRCFILES); do \
		(cd $(DST) 						\
		; ln -nsf $(SRC)/$$f `echo $$f| sed -e 's/_/./'`	\
		) done

### If we're using the MakeStuff package, chain in its Makefile
CHAIN = $(wildcard ../../MakeStuff/Makefile)
include $(CHAIN)

report-vars::
	@echo SRCFILES=$(SRCFILES)
	@echo NONLINKS=$(NONLINKS)
	@echo CHAIN=$(CHAIN)
