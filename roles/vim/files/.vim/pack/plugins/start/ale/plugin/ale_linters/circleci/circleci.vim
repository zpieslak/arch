function! ale_linters#circleci#circleci#Handle(buffer, lines) abort
    let l:loclist = []
    let l:error_message = []

    for l:line in a:lines
        if l:line =~# '^\s*-\s'
            call add(l:error_message, l:line)
        endif
    endfor

    if !empty(l:error_message)
      call add(l:loclist, {
                  \ 'lnum': 1,
                  \ 'col': 1,
                  \ 'text': join(l:error_message, "\n"),
                  \ 'type': 'E',
                  \ })
     endif

    return l:loclist
endfunction

call ale#linter#Define('circleci', {
\   'name': 'circleci',
\   'executable': {b -> expand('#' . b . ':p') =~# '\.circleci' ? 'circleci' : ''},
\   'command': 'circleci --skip-update-check config validate - < %s',
\   'callback': 'ale_linters#circleci#circleci#Handle',
\   'output_stream': 'stderr',
\   'lint_file': 1,
\})

