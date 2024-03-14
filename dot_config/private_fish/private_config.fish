if test (arch) = "i386"
  set HOMEBREW_PREFIX /usr/local
else
  set HOMEBREW_PREFIX /opt/homebrew
end
fish_add_path -m --path $HOMEBREW_PREFIX/bin

status --is-interactive; and eval ($HOMEBREW_PREFIX/bin/brew shellenv)
set -x JAVA_HOME /opt/homebrew/Cellar/openjdk@17/17.0.9/libexec/openjdk.jdk/Contents/Home -v 17
set -x LANG en_US.UTF-8
set -x SSH_AUTH_SOCK ~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
# Set pyenv root directory
set PYENV_ROOT $HOME/.pyenv
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
atuin init fish | source
    # Commands to run in interactive sessions can go here
end

fish_add_path --path /Users/travisll/rubyonmac
source /Users/travisll/.config/op/plugins.sh

chruby ruby-3.2.3

status --is-interactive; and source (nodenv init -|psub)

nodenv global 18.19.1
