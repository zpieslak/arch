" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

" Check files
let g:ale_linters = {
\ 'ansible': ['ansible_lint'],
\ 'cs': ['OmniSharp'],
\ 'haskell': ['ghc'],
\ 'javascript': ['eslint', 'prettier'],
\ 'json' : ['jq', 'prettier'],
\ 'markdown' : ['languagetool'],
\ 'python' : ['flake8', 'mypy'],
\ 'ruby' : ['rubocop'],
\ 'terraform' : ['terraform'],
\ 'typescript' : ['eslint', 'tslint'],
\ 'typescriptreact' : ['eslint'],
\ 'yaml' : ['yamllint'],
\ 'cloudformation' : ['cfn-lint'],
\}

" Fix files
let g:ale_fixers = {
\ 'cs': ['dotnet-format'],
\ 'javascript': ['eslint', 'prettier'],
\ 'python' : ['autopep8'],
\ 'ruby' : ['rubocop'],
\ 'json' : ['jq'],
\ 'terraform' : ['terraform'],
\ 'typescript' : ['eslint', 'prettier', 'tslint'],
\ 'typescriptreact' : ['tslint'],
\}
