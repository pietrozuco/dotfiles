# Path to your oh-my-zsh installation.
export ZSH="/Users/$USER/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# PATH
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:${HOME}/bin:${HOME}/.local/bin"
export NCURSES_PATH='/usr/local/opt/ncurses/bin'
export X11_PATH='/opt/X11/bin'
export PYENV_ROOT="$HOME/.pyenv"
export FZF_PATH="/usr/local/opt/fzf/bin"
export GNUBIN="/usr/local/opt/coreutils/libexec/gnubin"
export GEMS="$HOME/.gem/bin"
export PATH="$GNUBIN:/bin:$NCURSES_PATH:$X11_PATH:$PYENV_ROOT/bin:$FZF_PATH:$GEMS:$PATH"


# Terminal configuration
#export TERM=screen-256color
export LESS="-R" # allow escape sequences to be interpreted properly
export EDITOR="vim"
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8
export DEFAULT_USER="$USER"

# history settings
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt EXTENDED_HISTORY
unsetopt correct_all
setopt share_history
setopt inc_append_history
setopt extended_history
setopt hist_no_store
setopt hist_save_no_dups
HISTFILE=$HOME/.zsh_history
HISTSIZE=9999
SAVEHIST=9999

# Aliases
alias activate='source venv/bin/activate'
alias vi="vim"
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gdl="gl -p"
alias diff='colordiff'
alias ls='ls --color'

# terminal settings
case $TERM in
  *rxvt*|*term)
    precmd() {
      print -Pn "\e]0;%m:%~\a"
    }
    preexec() {
      print -Pn "\e]0;$1\a"
    }

    TERM="screen-256color"
  ;;
esac

# For compilers to find ncurses you may need to set:
export LDFLAGS="-L/usr/local/opt/ncurses/lib"
export CPPFLAGS="-I/usr/local/opt/ncurses/include"

# For pkg-config to find ncurses you may need to set:
export PKG_CONFIG_PATH="/usr/local/opt/ncurses/lib/pkgconfig"

# PYENV
# Tell pyenv-virtualenvwrapper to use pyenv when creating new Python environments
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
if command -v pyenv 1>/dev/null 2>&1; then  eval "$(pyenv init --path)";fi
export WORKON_HOME=~/.virtualenvs

# fzf

export FZF_COMPLETION_TRIGGER='@'
export FZF_TMUX_HEIGHT="25%"
export FZF_DEFAULT_OPTS='
  --extended-exact
  +s
  --color=fg:-1,bg:-1,hl:118,fg+:-1,bg+:-1,hl+:200
  --color=info:060,prompt:118,spinner:208,pointer:156,marker:208
'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Ruby
export GEM_HOME="$HOME/.gem"

# fuzzy file search
zle      -N   fzf-file-widget
bindkey '^F' fzf-file-widget
