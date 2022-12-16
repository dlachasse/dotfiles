[ -f ~/.fzf.bash ] && source ~/.fzf.bash
eval "$(pyenv init -)"
eval "$(pyenv init -)"
eval "$(pyenv init -)"
eval "$(pyenv init -)"


# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/bashrc"
