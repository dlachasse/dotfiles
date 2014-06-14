export PATH=$PATH:$HOME/bin:/usr/local/bin/npm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export EDITOR=/Applications/Sublime\ Text.app

alias gcb='git checkout -b'
alias hack='hack.sh'
alias ship='ship.sh'
alias dwf='dwf.sh'
alias md='md.sh'
alias bi='bundle install'
alias migrate='rake db:migrate && rake db:test:prepare'
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
chflags nohidden ~/Library/

# if [ -f `brew --prefix`/etc/bash_completion ]; then
#  . `brew --prefix`/etc/bash_completion
# fi

##################
## Begin bashstrap
##################

### Aliases

# Color LS
colorflag="-G"
alias ls="command ls ${colorflag}"
alias l="ls -lF ${colorflag}" # all files, in long format
alias la="ls -laF ${colorflag}" # all files inc dotfiles, in long format
alias lsd='ls -lF ${colorflag} | grep "^d"' # only directories

# Quicker navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Shortcuts to my Code folder in my home directory
alias code="cd ~/Dev"

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Colored up cat!
# You must install Pygments first - "sudo easy_install Pygments"
alias c='pygmentize -O style=monokai -f console256 -g'

# Git
# You must install Git first - ""
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m' # requires you to type a commit message
alias gp='git push'


### Prompt Colors
# Sexy Solarized Bash Prompt, inspired by "Extravagant Zsh Prompt"
# Screenshot: http://img.gf3.ca/d54942f474256ec26a49893681c49b5a.png

if [[ $COLORTERM = gnome-* && $TERM = xterm ]]  && infocmp gnome-256color >/dev/null 2>&1; then export TERM=gnome-256color
elif [[ $TERM != dumb ]] && infocmp xterm-256color >/dev/null 2>&1; then export TERM=xterm-256color
fi

if tput setaf 1 &> /dev/null; then
    tput sgr0
    if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
      BASE03=$(tput setaf 234)
      BASE02=$(tput setaf 235)
      BASE01=$(tput setaf 240)
      BASE00=$(tput setaf 241)
      BASE0=$(tput setaf 244)
      BASE1=$(tput setaf 245)
      BASE2=$(tput setaf 254)
      BASE3=$(tput setaf 230)
      YELLOW=$(tput setaf 136)
      ORANGE=$(tput setaf 166)
      RED=$(tput setaf 160)
      MAGENTA=$(tput setaf 125)
      VIOLET=$(tput setaf 61)
      BLUE=$(tput setaf 33)
      CYAN=$(tput setaf 37)
      GREEN=$(tput setaf 64)
    else
      BASE03=$(tput setaf 8)
      BASE02=$(tput setaf 0)
      BASE01=$(tput setaf 10)
      BASE00=$(tput setaf 11)
      BASE0=$(tput setaf 12)
      BASE1=$(tput setaf 14)
      BASE2=$(tput setaf 7)
      BASE3=$(tput setaf 15)
      YELLOW=$(tput setaf 3)
      ORANGE=$(tput setaf 9)
      RED=$(tput setaf 1)
      MAGENTA=$(tput setaf 5)
      VIOLET=$(tput setaf 13)
      BLUE=$(tput setaf 4)
      CYAN=$(tput setaf 6)
      GREEN=$(tput setaf 2)
    fi
    BOLD=$(tput bold)
    RESET=$(tput sgr0)
else
    # Linux console colors. I don't have the energy
    # to figure out the Solarized values
    MAGENTA="\033[1;31m"
    ORANGE="\033[1;33m"
    GREEN="\033[1;32m"
    PURPLE="\033[1;35m"
    WHITE="\033[1;37m"
    BOLD=""
    RESET="\033[m"
fi

parse_git_dirty () {
  [[ $(git status 2> /dev/null | tail -n1 | cut -c 1-17) != "nothing to commit" ]] && echo "*"
}
parse_git_branch () {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

PS1="\[${BOLD}${CYAN}\]\u \[$BASE0\]in \[$BLUE\]\w\[$BASE0\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[$YELLOW\]\$(parse_git_branch)\[$BASE0\]\n\$ \[$RESET\]"

### Misc

# Only show the current directory's name in the tab
export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'

# Get system data
ARCH=$(uname -m | sed 's/x86_//;s/i[3-6]86/32/')

if [ -f /etc/lsb-release ]; then
    . /etc/lsb-release
    OS=$DISTRIB_ID
    VER=$DISTRIB_RELEASE
elif [ -f /etc/debian_version ]; then
    OS=ubuntu  # XXX or Ubuntu??
    VER=$(cat /etc/debian_version)
elif [ -f /etc/yum.conf ]; then
    OS=centos
    VER=crappy-version
else
    OS=$(uname -s)
    VER=$(uname -r)
fi

case $(uname -m) in
x86_64)
    BITS=64
    ;;
i*86)
    BITS=32
    ;;
*)
    BITS=?
    ;;
esac

# config
export EDITOR='vim' #default

## file
alias purgedir="rm -rf .* *"
alias purgeswap="rm -rf ~/.vim/swapfiles"
alias home="cd ~"
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

## remote
alias list="screen -list"
alias web="cd /var/www/html"

# git
alias gp="git pull origin $1"
alias gcm="git commit -a -m $1"
alias gbl="git branch --list"
function gcr() {
  echo "git checkout -b $1 origin/$1";
  echo `git checkout -b $1 origin/$1`;
}

## compression
alias untar="tar -xvf $1"

#** SERVER **#
    if [[ $OS == 'centos' ]]; then
        ## apache
        alias serverconf="sudo vim /etc/httpd/conf/httpd.conf"
        alias sslconf="sudo vim /etc/httpd/conf.d/ssl.conf"

        alias serverrestart="sudo /sbin/service httpd restart"
        alias serverstop="sudo /sbin/service httpd stop"
        alias serverstart="sudo /sbin/service httpd start"

        #php
        alias phpini="sudo vim /etc/php.ini"

    elif [[ $OS == 'Darwin' ]]; then
        ## osx only
        alias showhidden="defaults write com.apple.finder AppleShowAllFiles -boolean true ; killall Finder"
        alias hidehidden="defaults write com.apple.finder AppleShowAllFiles -boolean false ; killall Finder"
        alias dsoff="defaults write com.apple.desktopservices DSDontWriteNetworkStores true"
        alias dson="defaults write com.apple.desktopservices DSDontWriteNetworkStores false"

        #set sublime to default editor. gen symlink for executing via cmd line
        if [ "$EDITOR" != 'sublime' ]; then export EDITOR='sublime'; fi;
        if [[ ! -f //usr/local/bin/sublime ]]; then
          echo `ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/sublime`
        fi
    elif [[ $OS == 'ubuntu' ]]; then
        alias serverconf="sudo vim /etc/apache2/sites-enabled/000-default"
        alias siteconf="sudo vim /etc/apache2/envvars"

        alias serverrestart="sudo /etc/init.d/apache2 restart"
        alias serverstop="sudo /etc/init.d/apache2 stop"
        alias serverstart="sudo /etc/init.d/apache2 start"

        #php
        alias phpini="sudo vim /etc/php5/apache2/php.ini"
    fi

alias vimrc="vim ~/.vimrc"
alias aliases="$EDITOR ~/.aliases.sh"
alias ualiases="(cd ~;git add ~/.aliases.sh; git commit -m 'aliases updated';git push origin master;)"

## git
clonehere () {
    git init | git remote add origin $1 | git pull origin
}

## screen
# kill detached
killd () {
    screen -ls | grep Detached | cut -d. -f1 | awk '{print $1}' | xargs kill
}
# kill all
killa () {
    screen -ls | grep Detached | cut -d. -f1 | awk '{print $1}' | xargs kill
    screen -ls | grep tached | cut -d. -f1 | awk '{print $1}' | xargs kill
}

# Get weird
echo "CHA-CHING! Deez is runnin' $OS $VER $BITS-bit"