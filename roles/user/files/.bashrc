# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Load configuration files
for file in "$HOME"/.bashrc.d/*.sh ; do
  [[ -f "$file" ]] && source $file
done
