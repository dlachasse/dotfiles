export AIRFLOW_HOME=~/airflow
export GOPATH=~/Dev/go
export EDITOR='vim'

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

. /usr/local/opt/asdf/asdf.sh
. /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash

# git
alias gcb='git checkout -b'
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m'
alias gl='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'
alias fix='$EDITOR `git diff --name-only | uniq`'
alias gsha='git rev-parse --short HEAD'
# https://medium.com/toutsbrasil/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# pepstaging
alias pstg="cd ~/Dev/ops-core/terraform/environments/staging"

# vim
alias vimrc="vim ~/.config/nvim/init.vim"
alias vim="nvim"

# redis
alias start-redis="redis-server /usr/local/etc/redis.conf"

# ruby
alias rspec="bundle exec rspec"

# python
alias lint="$HOME/Dev/style/bin/lint"

# AWS
alias ec2="sh ~/bin/ec2"

# tmux
alias tn="tmux new-session -s ${PWD##*/}"

# Bash Completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
source <(kubectl completion bash)
source /Users/dlachasse/.asdf/installs/rust/1.37.0/env

export PATH=/Users/dlachasse/.asdf/installs/rust/1.37.0/bin:$PATH
export PATH=/Users/dlachasse/Dev/style/bin:$PATH
export PATH=/Applications/Postgres.app/Contents/Versions/11/bin:$PATH
export GPG_TTY=$(tty)

[[ -r "/Users/dlachasse/bash_completion.sh" ]] && . "/Users/dlachasse/bash_completion.sh"
[[ -r "/Users/dlachasse/secrets.sh" ]] && . "/Users/dlachasse/secrets.sh"

eval "$(direnv hook bash)"
