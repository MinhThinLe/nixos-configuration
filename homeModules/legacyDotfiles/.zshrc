# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list ''
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl true
zstyle :compinstall filename "$HOME/.zshrc"
bindkey -v

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=5000
setopt autocd extendedglob
# End of lines configured by zsh-newuser-install
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

alias ls='eza'
alias l='ls'
alias cat='bat'
alias grep='rg'
alias stellacia-ssh='ssh -i ~/.ssh/id_rsa user@192.168.1.31'
alias reload='source ~/.zshrc'
alias cd='z'

export PATH=$HOME/.local/bin:$PATH
export EDITOR=nvim
export PAGER='bat'
export MANPAGER='bat -plman'
export BAT_THEME="gruvbox-dark"
