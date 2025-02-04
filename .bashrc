alias dc='docker compose'
alias drdb='dotnet restore && dotnet build'
alias gtcb='git checkout -b'
alias gtcl='git checkout -'
alias gtf='git fetch'
alias gtfp='git fetch && git pull'
alias gtp='git pull'
alias ll='eza -al'
alias ls='eza -a'
alias md=mkdir
alias rmd='rm -rf'

export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools

eval "$(oh-my-posh init bash --config ~/_work/me/scripts-n-cheatsheets/ohmyposh.json)"