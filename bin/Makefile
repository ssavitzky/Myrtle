### Makefile for bin
#

# DST = where to make the link; REL = relative path from there to here.
# PKG = the package we're in, i.e. Myrtle -- you might call it something else
#       note that Honu has to be in the same directory as $(PKG).
# REL = relative path for symlinks from DST -> here.

DST := ../../Honu/local
PKG := $(notdir $(shell dirname `pwd`))
REL := ../../$(PKG)/$(notdir $(shell pwd))

.PHONY: install report-vars

### Install bin
#	All we need to do is symlink this directory as Honu/local/myrtle_bin.
#	Honu's .bashrc is already set up to look there for [a-z]*_bin, so you
#	can use anything that starts with a lowercase letter.  Myrtle doesn't,
#	of course, but we can fix that with tr.

PFX = $(shell echo $(PKG) | tr A-Z a-z)
install::
	cd $(DST); ln -snf $(REL) ./$(PFX)_bin

### If we're using MakeStuff, chain in its Makefile
#	See ../Makefile for more information about MakeStuff.
#
CHAIN = $(firstword $(wildcard ../../MakeStuff/Makefile ../../../MakeStuff/Makefile))
include $(CHAIN)

report-vars::
	@echo " DST = '$(DST)'"
	@echo " PKG = '$(PKG)'"
	@echo " PFX = '$(PFX)'"
	@echo " REL = '$(REL)'"
	@echo " CHAIN='$(CHAIN)'"
