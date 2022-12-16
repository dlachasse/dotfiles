export AIRFLOW_HOME=~/airflow
export GOPATH=~/Dev/go
export EDITOR='nvim'

# Bash Completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc"

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

. $(brew --prefix asdf)/libexec/asdf.sh
. $(brew --prefix asdf)/etc/bash_completion.d/asdf.bash

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

# pandoc
alias deck="pandoc --to=revealjs -V revealjs-url=./reveal.js -V theme=white --self-contained --output=$1-$2.html --slide-level 2 weekly_template.md"

export PATH=~/Dev/style/bin:$PATH
export GPG_TTY=$(tty)

[[ -r "~/bash_completion.sh" ]] && . "~/bash_completion.sh"
[[ -r "~/secrets.sh" ]] && . "~/secrets.sh"

export PATH=~/.local/bin:$PATH
for bcfile in ~/.bash_completion.d/* ; do
  [ -f "$bcfile" ] && . $bcfile
done
. /usr/local/opt/asdf/libexec/asdf.sh
eval "$(gh completion -s bash)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/davidlachasse/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/davidlachasse/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/davidlachasse/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/davidlachasse/Downloads/google-cloud-sdk/completion.bash.inc'; fi


###### PDM
export PYTHONPATH='/Users/davidlachasse/.asdf/shims/python'
export PYTHONPATH='/usr/local/Cellar/pdm/1.10.3/libexec/lib/python3.10/site-packages/pdm/pep582':$PYTHONPATH
######

export PATH="~/.asdf/installs/poetry/1.2.2/bin:$PATH"
###### Enable direnv
eval "$(direnv hook bash)"
export PATH="$HOME/go/bin:$PATH"
