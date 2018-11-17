PS1="[\d \t] \w\$"

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
