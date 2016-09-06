Myrtle
======
Because turtle
--------------

> Where the wind takes us next year no turtle can tell<br>
> But we'll still be at home, come high water or hell,<br>
> Because home is wherever you carry your shell.<br>
> -- [Windward](http://steve.savitzky.net/Songs/windward/), by Stephen
> Savitzky, 2015

This project is a sample customization package for [Honu](../Honu).  Unlike
Honu, which is pretty generic unless your tastes are rather different from
mine, Myrtle is meant to be forked, hacked on, and otherwise made your own.
(My own customized version is called Mathilda, and you won't find it here on
GitHub.

Myrtle is meant to be installed in the same directory as Honu.  It has a
`bootstrap.sh` script that sets up the environment variables that Honu is
looking for, bootstraps Honu, and finally does its own install.

Annotated Contents
------------------

### Files

`bootstrap.sh`

This is the shell script that runs the configuration process.  Just say:\
`wget -O - https://github.com/ssavitzky/Myrtle/raw/master/bootstrap.sh | bash`\
or something of the sort. You can also clone the repo and source it, but
half the fun is watching the magic unfold.

The sequence of events is:

1. Set up environment variables for Honu
2. Source Honu's bootstrap.sh from Github if it isn't local.
..- this, of course, installs your packages and dotfiles
3. Install its own dotfiles, e.g. your mail aliases, bookmarks, etc.
4. Overide some of the files in Honu/local.

`MIT-LICENSE.txt`

The license for this project.

`Makefile`

Once things get bootstrapped, the entire configuration process is run
via the Makefile. `make install` is the main target; eventually there
will be targets for partial installs, e.g. on tiny systems or systems
where I don't have `sudo` access.

### Directories

For the most part, these function just like the corresponding directories in
Honu.  Some of them are empty except for their Makefile, waiting for you to
add your own content.

`bin/`

Programs.  Your choice.  Symlinked from `../Honu/local`; `.bashrc` already
knows to look there.

`dotconfig/`

Configuration files and directories that go into `~/.config/`. These are
symlinked so as not to conflict with the stuff already there.

`dotfiles/`

Configuration files that go into the home directory. They are symlinked
rather than being copied.

`emacs/`

As with bin, we just symlink this from `../Honu/local`, where Honu's `.emacs`
is already set up to look for it.

`local/`

Files that are expected to be edited on a per-system or per-user basis.
Initial versions are created by `make install`; they are symlinked into
`../Honu/local`, so you can use them to override the defaults that Honu
installs. 

`opt/`

The Makefile here lets you download and install various optional
programs from elsenet. (Right now the only one is `dzen2` -- older
releases of Debian and Ubuntu don't have one that's recent enough to
include all the features I want to use with `xmonad`.)

`setup/`

Scripts for configuring the things that can't (easily) be installed by
simply symlinking a dotfile. This includes a lot of Gnome options. There
are also files with a `-pkgs` suffix, that install programs using `apt`.

------------------------------------------------------------------------

**Copyright © Stephen R. Savitzky (HyperSpace Express)**

------------------------------------------------------------------------
