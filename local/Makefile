### Makefile for local
#
#   This directory contains files intended to be edited locally.  Sample
#   copies are created by make install, but it is expected that nearly
#   all will be edited to accommodate things like screen sizes, names,
#   email addresses, remote hosts, and the like.
#
#   Here's how it works:
#	Files with names starting with _ get copied to local_ for
#	editing.  Other files, e.g. my_*, are kept as-is, in git.
#
#	All files matching [a-z]_* are then symlinked into
#	../Honu/local, overriding the ones already there.

DST := ../../Honu/local
PKG := $(notdir $(shell dirname `pwd`))
REL := ../../$(PKG)/$(notdir $(shell pwd))
PFX = $(shell echo $(PKG) | tr A-Z a-z)

MAKE_FILES = local_gitconfig
COPY_FILES = $(addprefix local,$(wildcard _*))
FILES =  $(COPY_FILES) $(MAKE_FILES)
LINKS = $(addprefix ../../Honu/local/, $(FILES))

.PHONY: install files report-vars

### Install dotfiles in $(HOME).
#
install:: links_in_Honu
	@echo local configuration files will probably have to be edited.

clean::
	rm -f $(FILES)

files:: $(FILES)

links_in_Honu:: 	| $(FILES)
	cd $(DST); ln -snf $(REL)/[a-z]* .

### Config files copied from prototypes:
#
#	Prototypes have names starting with _, which keeps the directory
#	listing from getting too cluttered and makes them easy to identify.
#	Config files derived from them	have names starting with "Mathilda_".
#	This one rule does it all in most cases; it can be overridden by
#	writing a specific recipe (cf. MAKE_FILES)
#
local_%: ; cp $(subst local,,$@)  $@


### Config files made using makefile recipes.
#	in most cases we do this so that we can do variable expansion here
#	in Makefile, where it's easy.  For that matter, we have all the power
#	of make rules at our command.  In some cases we just do it because
#	templates are easy and we want to avoid clutter.
#
local_gitconfig:
	echo "# edit git user name and email as needed." >$@
	@echo "$$local_gitconfig" >> $@

define local_gitconfig
[user]
	name = Steve Savitzky
	email = steve@savitzky.net
endef
export local_gitconfig


### If we're using the MakeStuff package, chain in its Makefile
#	See ../Makefile for more information.
#
CHAIN = $(wildcard ../../MakeStuff/Makefile)
include $(CHAIN)

report-vars::
	@echo PFX= $(PFX)
	@echo REL= $(REL)
	@echo LINKS=$(LINKS)
	@echo DOTFILES=$(DOTFILES)
	@echo CHAIN=$(CHAIN)
