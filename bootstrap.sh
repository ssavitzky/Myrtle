#!/bin/sh
# Bootstrap script for Myrtle
# sources Honu's bootstrap.sh, then does its own make install-pkgs and make-install.

### Overrides:

# Uncomment and edit any of these overrides you need to.
# If you have your own forks of Honu and MakeStuff you'll want to do something like...
# REPOS=git@github.com:ssavitzky        # base for git repositories

# It's usually safe to ignore these, because Honu's bootstrap tests for them.
#
# INSTALL_PKGS=true                     # set to false if you're not in the sudo group
# HAVE_X=true                           # set to false to skip X-related packages

## This is where we fetch Honu's bootstrap.sh from:
#      It's usually ok to fetch it from github even if you've set REPOS.
HONU=https://github.com/ssavitzky/Honu


### Here we go!  Pull down Honu's bootstrap, and source it.
#
wget -O honu-bootstrap.sh $HONU/raw/master/bootstrap.sh
. honu-bootstrap.sh
#
###

### At this point, you can re-bind REPOS and pull down some packages of your own.
#   Here's where you load your version of Myrtle, plus any extra packages you want
#   from your own repo.

MYRTLE=Myrtle
EXTRAS=
MY_REPOS=$REPOS

# fetch the repositories we need.
for r in $MYRTLE $EXTRAS; do
    if [ ! -d $$r ]; then git clone $MY_REPOS/$r.git; fi
done

if $INSTALL_PKGS; then
    # TODO:  look at HAVE_X in the makefiles
    (cd $MYRTLE; make install-pkgs)
fi

### Install the dotfiles and other goodies.
#   Note that not all of it will be useful or even usable without the
#   packages, but what's there will give you a comfortable $HOME.
(cd $MYRTLE; make install)

echo "I'm always at home in the seas where I dwell,"
echo Because home is wherever I carry my \$SHELL.
