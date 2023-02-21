status --is-interactive; and eval (/opt/homebrew/bin/brew shellenv)
set -x LANG en_US.UTF-8
set -x SSH_AUTH_SOCK ~/.1password/agent.sock
# Set pyenv root directory
set PYENV_ROOT $HOME/.pyenv
# Add pyenv and local bin to $PATH
# Add pyenv init to shell to enable shims and autocompletion 
# Note the command `pyenv init` will tell you to add this line for fish
set PATH $PYENV_ROOT/bin $PATH
set -x -g PATH /usr/local/bin /usr/local/sbin $PATH
set -x -g PATH /opt/homebrew/bin /opt/homebrew/sbin $PATH
#set -x -g PATH (brew --prefix coreutils)/libexec/gnubin $PATH
#set -x -g PATH (brew --prefix findutils)/libexec/gnubin $PATH
fnm env --use-on-cd | source
set -x PATH $PYENV_ROOT/shims $PATH
set -x PATH $PYENV_ROOT/bin $PATH
source /opt/homebrew/opt/asdf/libexec/asdf.fish
source $HOME/.config/fish/conf.d/abbr.fish
if command -v pyenv 1>/dev/null 2>&1
    pyenv init - | source
end
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
starship init fish | source
if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_add_path --path /Users/travisll/rubyonmac
