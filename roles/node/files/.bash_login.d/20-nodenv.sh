# Add to PATH
export PATH="$HOME/.nodenv/bin:$PATH"

# Initialize rbenv
eval "$(nodenv init -)"

# Functions
yarn() {
  $(pwd)/node_modules/yarn/bin/yarn "$@"
}
export -f yarn

prettier() {
  $(pwd)/node_modules/prettier/bin-prettier.js "$@"
}
export -f prettier
