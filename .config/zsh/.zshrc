# zsh config by markmiso

# enable colors and change prompt
autoload -U colors && colors
PS1="%~ %F{blue}» %f"

# configure history
HISTSIZE=1000
SAVEHIST=1000

# enable vi mode
bindkey -v
export KEYTIMEOUT=1

# enable tab completion
autoload -Uz compinit
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION

# Aliases
alias ls='ls --color=auto'
alias lyrics='$HOME/.local/bin/lyrics'
alias vifm='$XDG_CONFIG_HOME/vifm/scripts/vifmrun.sh'
alias music='$XDG_CONFIG_HOME/ncmpcpp/ncmpcpp-ueberzug/ncmpcpp-ueberzug'
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'
alias fetch='$XDG_CONFIG_HOME/cleanfetch/cleanfetch.sh'
