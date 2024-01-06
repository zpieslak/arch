function! ale_linters#envconfig#dotenv_linter#Handle(buffer, lines) abort
    let l:output = []

    for l:line in a:lines
        let l:match = matchlist(l:line, '\v^([^:]+):(\d+) ([^:]+): (.+)$')

        if len(l:match) == 0
            continue
        endif

        let l:item = {
        \   'lnum': l:match[2] + 0,
        \   'type': (l:match[3] is# 'Error' ? 'E' : 'W'),
        \   'text': l:match[4],
        \}

        call add(l:output, l:item)
    endfor

    return l:output
endfunction

call ale#linter#Define('envconfig', {
\   'name': 'dotenv-linter',
\   'executable': 'dotenv-linter',
\   'command': 'dotenv-linter -q --not-check-updates --no-color %s',
\   'errorformat': '%f:%l %t: %e',
\   'callback': 'ale_linters#envconfig#dotenv_linter#Handle',
\})

