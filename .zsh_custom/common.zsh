# common aliases

# Homebrew
alias brewup='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'

# Java
export PATH="/Library/Java/Home/bin:$PATH"

# thefuck (see https://github.com/nvbn/thefuck)
alias fuck="thefuck -ry"
alias ef="fuck"

# nvm
export NVM_DIR="$HOME/.nvm"
source "/usr/local/opt/nvm/nvm.sh"

