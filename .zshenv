# zsh environment by markmiso

# sets XDG Base Directory default directories
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

# adds '.local/bin' to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')" 

# set default programs
export EDITOR=vim
export TERMINAL=alacritty
export BROWSER=firefox

# set zsh to use XDG Base Directory standard
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export HISTFILE=$XDG_DATA_HOME/zsh/history
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION

# set vim to use XDG Base Directory standard
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'

# set gtk-2.0 to use XDG Base Directory standard
export GTK2_RC_FILES=$XDG_CONFIG_HOME/gtk-2.0/gtkrc
