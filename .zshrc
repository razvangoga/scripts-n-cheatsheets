alias cdm=codium
alias brewup='brew upgrade --greedy'
alias dc='docker compose'
alias drdb='dotnet restore && dotnet build'
alias gtcb='git checkout -b'
alias ll='eza -al'
alias ls='eza -a'
alias md=mkdir
alias rmd='rm -rf'
alias tf=terraform

eval "$(oh-my-posh init zsh -c ~/_work/me/scripts-n-cheatsheets/ohmyposh.json)"

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export LANG=C