" Beacount fixer
function! ale#fixers#beanformat#Fix(buffer) abort
  return {
  \ 'command': 'bean-format %t'
  \}
endfunction

call ale#fix#registry#Add(
  \ 'bean-format',
  \ 'ale#fixers#beanformat#Fix',
  \ ['beancount'],
  \ 'bean-format'
\)
