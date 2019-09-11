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

source $HOME/.macbook/.profile
