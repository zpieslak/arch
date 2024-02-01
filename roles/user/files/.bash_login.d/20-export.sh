# Override PATH
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.yarn/bin

# Ssh-agent socket
if [ -z "${SSH_AUTH_SOCK+x}" ]; then
  export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
fi

# mysql 5.7
if [[ -d "/opt/homebrew/opt/mysql@5.7" ]]; then
  export PATH="/opt/homebrew/opt/mysql@5.7/bin:$PATH"
  export LDFLAGS="-L/opt/homebrew/opt/mysql@5.7/lib"
  export CPPFLAGS="-I/opt/homebrew/opt/mysql@5.7/include"
  export PKG_CONFIG_PATH="/opt/homebrew/opt/mysql@5.7/lib/pkgconfig"
fi

# Set PS1
export PS1='-> '
