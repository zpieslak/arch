# Enable bash completion
source /usr/share/git/completion/git-completion.bash

# Enable git prompt
source /usr/share/git/completion/git-prompt.sh

# Git branch status
export PS1='\h:\w$(__git_ps1 "[%s]")\$ '
