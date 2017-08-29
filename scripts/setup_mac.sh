#!/bin/bash

# assume that we are in the $ROOT/scripts
./shared/setup_symlinks.sh
./macOS/install_homebrew_mac.sh
./shared/install_common_brew.sh
./shared/setup_zsh.sh
 # oops - Oh My Zsh just overwrote our `.zshrc` symlink
mv -f $HOME/.zshrc.pre-oh-my-zsh $HOME/.zshrc
./macOS/setup_iTerm_shell_integration
