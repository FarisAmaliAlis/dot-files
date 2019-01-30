" Profile neovim and save results to profile.log
function! g:utils#profile() abort
  execute 'profile start profile.log'
  execute 'profile func *'
  execute 'profile file *'
  echom 'Profiling started (will last until you quit neovim).'
endfunction

" When cycling ignore NERDTree and Tagbar
function! g:utils#intelligentCycling() abort
  wincmd w
  if &filetype ==# 'nerdtree'
    call g:utils#intelligentCycling()
  endif
  if &buftype ==# 'terminal'
    startinsert!
  endif
endfunction

" Natural resizing
function! g:utils#intelligentVerticalResize(direction) abort
  let l:window_resize_count = 5
  let l:current_window_is_last_window = (winnr() == winnr('$'))

  if (a:direction ==# 'left')
    let [l:modifier_1, l:modifier_2] = ['+', '-']
  else
    let [l:modifier_1, l:modifier_2] = ['-', '+']
  endif

  let l:modifier = l:current_window_is_last_window ? l:modifier_1 : l:modifier_2
  let l:command = 'vertical resize ' . l:modifier . l:window_resize_count . '<CR>'
  execute l:command
endfunction

" Run NERDTreeFind or Toggle based on current buffer
function! g:utils#nerdWrapper() abort
  if &filetype ==# ''
    :NERDTreeToggle
  elseif expand('%:t') =~? 'NERD_tree'
    wincmd w
  else
    :NERDTreeFind
  endif
endfunction

" Strip trailing spaces
function! g:utils#stripTrailingWhitespaces() abort
  let l:lastSearch = @/
  let l:line = line('.')
  let l:col = col('.')

  execute '%s/\s\+$//e'

  let @/ = l:lastSearch
  call cursor(l:line, l:col)
endfunction

" Mode function for Lightline statusline
function! g:utils#lightLineMode() abort
  let l:fname = expand('%:t')
  return l:fname =~? 'NERD_tree' ? 'NT' :
        \ &filetype ==? 'unite' ? 'Unite' :
        \ winwidth(0) > 70 ? g:lightline#mode() : ''
endfunction

" File format function for Lightline statusline
function! g:utils#lightLineFileformat() abort
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

" Filetype function for Lightline statusline
function! g:utils#lightLineFiletype() abort
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

" File encoding function for Lightline statusline
function! g:utils#lightLineFileencoding() abort
  return winwidth(0) > 70 ? (strlen(&fileencoding) ? &fileencoding : &encoding) : ''
endfunction

" Search current word with grep
function! g:utils#searchCurrentWordWithAg() abort
  execute 'Ag' expand('<cword>')
endfunction

" Nice block heading
function! g:utils#blockHeading(width, word) abort
  let l:char = '='
  let l:inserted_word = ' ' . a:word . ' '
  let l:word_width = strlen(l:inserted_word)
  let l:length_before = (a:width - l:word_width) / 2
  let l:hashes_before = repeat(l:char, l:length_before)
  let l:hashes_after = repeat(l:char, a:width - (l:word_width + l:length_before))
  let l:comment_line = repeat(l:char, a:width)
  let l:word_line = l:hashes_before . l:inserted_word . l:hashes_after

  :put =l:comment_line
  :put =l:word_line
  :put =l:comment_line
endfunction

" Toggle fmtaugroup
function! g:utils#toggleFmt() abort
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
