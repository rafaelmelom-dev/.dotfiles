autoload -Uz colors && colors

# Setup prompt 
autoload -Uz promptinit && promptinit
prompt redhat

# Basic zsh auto completion
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
# Auto completion with case-sensitivy
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Alias to add some colors (default bash config)
alias ls='ls --color=auto'
alias grep='grep --color=auto'
