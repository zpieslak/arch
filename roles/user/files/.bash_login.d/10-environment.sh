# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# The number of commands to remember in the command history.
HISTSIZE=1000

# The maximum number of lines contained in the history file.
HISTFILESIZE=2000

# Autocomplete command names
complete -c man which

# Append to the history file, don't overwrite it.
shopt -s histappend

# Check the window size after each command and, if necessary.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context.
shopt -s globstar
