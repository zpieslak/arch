call ale#linter#Define('githubaction', {
\   'name': 'actionlint',
\   'executable': {b -> expand('#' . b . ':p:h') =~? '\.github/workflows$' ? 'actionlint' : ''},
\   'command': function('ale_linters#yaml#actionlint#GetCommand'),
\   'callback': 'ale_linters#yaml#actionlint#Handle',
\   'output_stream': 'stdout',
\})
