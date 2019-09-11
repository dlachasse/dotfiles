export AIRFLOW_HOME=~/airflow
export GOPATH=~/Dev/go
export EDITOR='vim'

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
parse_git_dirty () {
  [[ $(git status 2> /dev/null | tail -n1 | cut -c 1-17) != "nothing to commit" ]] && echo "*"
}
parse_git_branch () {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

BOLD=$(tput bold)
CYAN=$(tput setaf 37)
BASE0=$(tput setaf 244)
BLUE=$(tput setaf 33)
YELLOW=$(tput setaf 136)
RESET=$(tput sgr0)

PS1="\[${BOLD}${CYAN}\]DLC \[$BASE0\]in \[$BLUE\]\w\[$BASE0\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[$YELLOW\]\$(parse_git_branch)\[$BASE0\]\n\$ \[$RESET\]"

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# git
alias gcb='git checkout -b'
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m'
alias gl='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'
alias fix='$EDITOR `git diff --name-only | uniq`'

# vim
alias vimrc="vim ~/.vimrc"

# redis
alias start-redis="redis-server /usr/local/etc/redis.conf"

# ruby
alias rspec="bundle exec rspec"

# AWS
alias ec2="sh ~/bin/ec2"

# tmux
alias tn="tmux new-session -s ${PWD##*/}"

# Bash Completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
source <(kubectl completion bash)
source /Users/davidlachasse/.asdf/installs/rust/1.36.0/env
