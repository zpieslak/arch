if [ -f "$HOME/.dircolors" ]; then
  eval $(dircolors -b $HOME/.dircolors)
fi

alias ls='ls -lh --color=auto'
alias grep='grep --color=auto'
