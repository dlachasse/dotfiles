export PATH=$PATH:$HOME/bin:/usr/local/bin/npm
export PATH="/Applications/Postgres.app/Contents/MacOS/bin:${PATH}"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

PS1="\w: "

alias gcb='git checkout -b'
alias hack='hack.sh'
alias ship='ship.sh'
alias dwf='dwf.sh'
alias migrate='rake db:migrate && rake db:test:prepare'
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
chflags nohidden ~/Library/

# if [ -f `brew --prefix`/etc/bash_completion ]; then
#  . `brew --prefix`/etc/bash_completion
# fi
