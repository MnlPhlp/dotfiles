# Path to your oh-my-zsh installation.
ZSH=$HOME/.oh-my-zsh/
plugins=(fzf)

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi
# setup oh-my-zsh
source $ZSH/oh-my-zsh.sh

# setup starship prompt
eval "$(starship init zsh)"

# Turn off all beeps
unsetopt BEEP

# source aliases etc.
source ~/.commonrc

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
