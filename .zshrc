alias cdm=codium
alias brewup='brew upgrade --greedy'
alias dc=docker-compose
alias drdb='dotnet restore && dotnet build'
alias gtcb='git checkout -b'
alias ll='exa -al'
alias ls='exa -a'
alias md=mkdir
alias rmd='rm -rf'
alias tf=terraform

eval "$(oh-my-posh init zsh -c ~/OneDrive/Work/scripts-n-cheatsheets/ohmyposh.json)"

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

#export DOTNET_CLI_UI_LANGUAGE=en-US
export LANG=C