# Path to your oh-my-zsh installation
export ZSH=$HOME/.oh-my-zsh

# Use a custom folder other than $ZSH/custom
ZSH_CUSTOM=$HOME/.zsh_custom

# Set name of the theme to load
ZSH_THEME="powerlevel9k/powerlevel9k"
# See https://github.com/bhilburn/powerlevel9k

# Use case-sensitive completion
CASE_SENSITIVE="true"

# _ and - will be interchangeable (case sensitive completion must be off)
HYPHEN_INSENSITIVE="true"

# How often to auto-update (in days)
export UPDATE_ZSH_DAYS=1

# Enable command auto-correction
# ENABLE_CORRECTION="true"

# Display red dots whilst waiting for completion
COMPLETION_WAITING_DOTS="true"

# Disable marking untracked files under VCS as dirty - this makes repository
# status check for large repositories much, much faster
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Change the command execution time stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy--mm--dd"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Add wisely, as too many plugins slow down shell startup.
case $(uname) in
    Darwin)  # macos
        plugins=(brew chucknorris common-aliases encode64 gitfast git-flow httpie osx sudo) ;;
    Linux)
        plugins=(common-aliases encode64 gitfast git-flow sudo) ;;
    *) ;;  # no-op - I only care about macos and linux
esac

# User configuration
# oh-my-zsh users are encouraged to define aliases within the ZSH_CUSTOM folder
# Files in the custom directory will be automatically loaded by the init
# script, in alphabetical order.
# Plugins placed in $ZSHCUSTOM/plugins will override ones with the same
# name in the main plugins directory.

source $ZSH/oh-my-zsh.sh
