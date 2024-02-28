" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

" Set rubocop executable
let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_ruby_standardrb_executable = 'bundle'

" Check files
let g:ale_linters = {
\ 'ansible': ['ansible_lint'],
\ 'cloudformation' : ['cfn-lint'],
\ 'cs': ['OmniSharp'],
\ 'css': ['stylelint'],
\ 'envconfig': ['dotenv-linter'],
\ 'haskell': ['ghc'],
\ 'javascript': ['eslint', 'prettier'],
\ 'json' : ['jq'],
\ 'markdown' : ['languagetool'],
\ 'python' : ['flake8', 'mypy'],
\ 'ruby' : ['standardrb'],
\ 'sh' : ['shellcheck'],
\ 'terraform' : ['terraform', 'tflint'],
\ 'typescript' : ['eslint', 'tsserver'],
\ 'typescriptreact' : ['eslint', 'tsserver'],
\ 'yaml.circleci' : ['circleci'],
\ 'yaml' : ['yamllint'],
\}

" Fix files
let g:ale_fixers = {
\ 'beancount': ['bean-format'],
\ 'cs': ['dotnet-format'],
\ 'css': ['prettier', 'stylelint'],
\ 'javascript': ['eslint'],
\ 'json' : ['jq'],
\ 'python' : ['autopep8'],
\ 'ruby' : ['standardrb'],
\ 'terraform' : ['terraform'],
\ 'typescript' : ['eslint'],
\ 'typescriptreact' : ['eslint'],
\}
