alias dc='docker compose'
alias drdb='dotnet restore && dotnet build'
alias gtcb='git checkout -b'
alias ll='eza -al'
alias ls='eza -a'
alias md=mkdir
alias rmd='rm -rf'

export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools

eval "$(oh-my-posh init bash --config ~/OneDrive/Work/scripts-n-cheatsheets/ohmyposh.json)"