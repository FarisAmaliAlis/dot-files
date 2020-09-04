" strip trailing spaces
function! g:util#stripTrailingWhitespaces() abort
  let l:lastSearch = @/
  let l:line = line('.')
  let l:col = col('.')

  execute '%s/\s\+$//e'

  let @/ = l:lastSearch
  call cursor(l:line, l:col)
endfunction

" search current word with ripgrep
function! g:util#searchCurrentWordWithRg() abort
  execute 'Rg' expand('<cword>')
endfunction

function! g:util#bufferClear() abort
  :Bonly
endfunction

" toggle fmtaugroup
function! g:util#toggleFmt() abort
    if !exists('#toggleFmt#BufWritePre')
        augroup toggleFmt
            autocmd!
            autocmd BufWritePre * Neoformat
        augroup END
        echom 'Neoformat enabled!'
    else
        augroup toggleFmt
            autocmd!
        augroup END
        echom 'Neoformat disabled!'
    endif
endfunction
