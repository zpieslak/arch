# Enable bash completion
if [[ -f "/opt/homebrew/etc/bash_completion.d/git-completion.bash" ]]; then
  source /opt/homebrew/etc/bash_completion.d/git-completion.bash
fi

if [[ -f "/usr/share/git/completion/git-completion.bash" ]]; then
  source /usr/share/git/completion/git-completion.bash
fi
