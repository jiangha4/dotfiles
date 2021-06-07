#
# Prompt Stuff
# -----------------------------------------------------------------------------

case ${TERM} in
  hp | hpterm )
    # HP-UX hpterm text color escape sequences (same as HP DeskJet PCL text color)
    TEXT_BLACK="^[&v0S"
    TEXT_DK_GRAY=""
    TEXT_BLUE="^[&v4S"
    TEXT_LT_BLUE=""
    TEXT_GREEN="^[&v2S"
    TEXT_LT_GREEN=""
    TEXT_CYAN="^[&v6S"
    TEXT_LT_CYAN=""
    TEXT_RED="^[&v1S"
    TEXT_LT_RED=""
    TEXT_MAGENTA="^[&v5S"
    TEXT_LT_MAGENTA=""
    TEXT_BROWN=""
    TEXT_YELLOW="^[&v3S"
    TEXT_LT_GRAY=""
    TEXT_WHITE="^[&v7S"
    TEXT_NORMAL="^[&vS"
    ;;
  xterm )
  # Bash shell text color escape sequences (used primarily by Linux)
    TEXT_BLACK="\[\033[0;30m\]"
    TEXT_DK_GRAY="\[\033[1;30m\]"
    TEXT_BLUE="\[\033[0;34m\]"
    TEXT_LT_BLUE="\[\033[1;34m\]"
    TEXT_GREEN="\[\033[0;32m\]"
    TEXT_LT_GREEN="\[\033[1;32m\]"
    TEXT_CYAN="\[\033[0;36m\]"
    TEXT_LT_CYAN="\[\033[1;36m\]"
    TEXT_RED="\[\033[0;31m\]"
    TEXT_LT_RED="\[\033[1;31m\]"
    TEXT_MAGENTA="\[\033[0;35m\]"
    TEXT_LT_MAGENTA="\[\033[1;35m\]"
    TEXT_BROWN="\[\033[0;33m\]"
    TEXT_YELLOW="\[\033[1;33m\]"
    TEXT_LT_GRAY="\[\033[0;37m\]"
    TEXT_WHITE="\[\033[1;37m\]"
    TEXT_NORMAL="\[\033[0m\]"
    ;;
  * )
  # Unknown terminal, so don't try to change text color
    TEXT_BLACK=""
    TEXT_DK_GRAY=""
    TEXT_BLUE=""
    TEXT_LT_BLUE=""
    TEXT_GREEN=""
    TEXT_LT_GREEN=""
    TEXT_CYAN=""
    TEXT_LT_CYAN=""
    TEXT_RED=""
    TEXT_LT_RED=""
    TEXT_MAGENTA=""
    TEXT_LT_MAGENTA=""
    TEXT_BROWN=""
    TEXT_YELLOW=""
    TEXT_LT_GRAY=""
    TEXT_WHITE=""
    TEXT_NORMAL=""
    ;;
esac

function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo "("${ref#refs/heads/}")"
}
# Set the generic prompt.
PS1='\[\033]0;\w\007 \033[32m\]\u@\h \[\033[33m\w\033[0m\]
$(parse_git_branch)->'

#   alias
#   --------------------------------------------------------

alias c='clear'
alias cs='clear;ls'
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'
alias lsa='ls -la'
alias lsl='ls -l'
alias home='cd ~'
alias sb='source ~/.bashrc'

alias ..="cd .."
alias ...="cd ../.."
alias .....="cd ../../.."

#   Mac Specific alias
#   --------------------------------------------------------
if [[ "$OSTYPE" == "darwin"* ]]; then
    alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES;\
        killall Finder /System/Library/CoreServices/Finder.app'
    alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO;\
        killall Finder /System/Library/CoreServices/Finder.app'
fi
#   extract:  Extract most know archives with one command
#   ---------------------------------------------------------
    extract () {
        if [ -f $1 ] ; then
          case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
             esac
         else
             echo "'$1' is not a valid file"
         fi
    }

#   Python virtual environments:
#   https://github.com/registerguard/registerguard.github.com/wiki/Install-python,-virtualenv,
#   -virtualenvwrapper-in-a-brew-environment
#   HOME ENVIRONMENT
#   -------------------------------------------------------------
if [ -f $HOME/.hp_alias ];
then
  source $HOME/.hp_alias
else
  export WORKON_HOME=$HOME/.virtualenvs
  export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
  export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
  export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
  export PIP_VIRTUALENV_BASE=$WORKON_HOME
  export PIP_RESPECT_VIRTUALENV=true
  if [[ -r /usr/local/bin/virtualenvwrapper.sh ]]; then
    source /usr/local/bin/virtualenvwrapper.sh
  else
    echo "WARNING: Can't find virtualenvwrapper.sh"
  fi
fi

# -----------------------------------------------------------------
#   LS Colors
# -----------------------------------------------------------------


export LSCOLORS="hehxcxdxbxegedabagacad"
alias ls='ls -lGH'

export EDITOR=vim
source "$HOME/.cargo/env"
