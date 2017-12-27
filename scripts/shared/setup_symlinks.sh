#!/bin/bash

# assume that we are in the $ROOT/scripts/shared and writing to $HOME
# move existing files to *.backup (forced move)

# change directory up to project root
pushd ../../

function set_up_symlink() {
    local dest=$HOME/$1
    if [ -e $dest ] || [ -L $dest ] ; then
        echo "Moving $dest to $dest.backup"
        mv -f $dest $dest.backup
    fi
    local source=`pwd`/$1
    ln -s $source $dest
}

# zsh
set_up_symlink '.zshrc'
set_up_symlink '.zsh_custom'

# iTerm
set_up_symlink '.iterm2_settings'

# vim
set_up_symlink '.vimrc'

# change directory back down to where we started
popd

# clean up
unset set_up_symlink
