# Override PATH
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/.yarn/bin"

# Ssh-agent socket
if [[ -z "${SSH_AUTH_SOCK+x}" ]]; then
  export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/gcr/ssh"
fi

# Set PS1
export PS1='-> '
