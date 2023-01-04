alias ls='exa -a'
alias ll='exa -al'
alias dc=docker-compose
alias md=mkdir
alias rmd='rm -rf'
alias tf=terraform

eval "$(oh-my-posh init zsh -c ~/OneDrive/Work/scripts-n-cheatsheets/ohmyposh.json)"

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh