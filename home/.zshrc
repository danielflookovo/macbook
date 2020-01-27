# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory beep nomatch
unsetopt autocd extendedglob notify
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/ovoguest/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status virtualenv aws)
source /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme

source $HOME/.macbook/.profile
