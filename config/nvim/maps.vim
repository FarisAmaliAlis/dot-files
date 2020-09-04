" leader
let g:mapleader="\<space>"

" defaults
nnoremap <up> <NOP>
nnoremap <down> <NOP>
nnoremap <left> <NOP>
nnoremap <right> <NOP>
nnoremap <bs> <NOP>
nnoremap <delete> <NOP>
inoremap <up> <NOP>
inoremap <down> <NOP>
inoremap <left> <NOP>
inoremap <right> <NOP>
nnoremap <Space> <NOP>
inoremap <F1> <NOP>
nnoremap <F1> <NOP>
nnoremap Q <NOP>

" visual linewise up and down by default (and use gj gk to go quicker)
nnoremap j gj
nnoremap k gk
nnoremap gj 5j
nnoremap gk 5k
vnoremap j gj
vnoremap k gk
vnoremap gj 5j
vnoremap gk 5k

" when jump to next match also center screen
nnoremap <silent> n :norm! nzz<CR>
nnoremap <silent> N :norm! Nzz<CR>
vnoremap <silent> n :norm! nzz<CR>
vnoremap <silent> N :norm! Nzz<CR>

" same when moving up and down
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz
vnoremap <C-u> <C-u>zz
vnoremap <C-d> <C-d>zz
vnoremap <C-f> <C-f>zz
vnoremap <C-b> <C-b>zz

" remap H and L (top, bottom of screen to left and right end of line)
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L g_

" more logical Y (default was alias for yy)
nnoremap Y y$

" don't yank to default register when changing something
nnoremap c "xc
xnoremap c "xc

" after block yank and paste, move cursor to the end of operated text and don't override register
vnoremap y y`]
vnoremap p "_dP`]
nnoremap p p`]

" use CamelCaseMotion instead of default motions
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

" fix the cw at the end of line bug default vim has special treatment (:help cw)
nmap cw ce
nmap dw de

" uppercase word in insert mode
inoremap <C-u> <ESC>mzgUiw`za

" matching brackets with TAB (using matchit) (Breaks the <C-i> jump)
map <TAB> %
silent! unmap [%
silent! unmap ]%

" don't cancel visual select when shifting
xnoremap <  <gv
xnoremap >  >gv

" make . work with visually selected lines
xnoremap . :norm.<CR>

" navigate popup menu
inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"

" quick save and close buffer
nnoremap ,w :w<CR>
nnoremap <silent> ,c :Sayonara!<CR>
nnoremap <silent> ,q :Sayonara<CR>

" yank and paste from clipboard
nnoremap ,y "+y
vnoremap ,y "+y
nnoremap ,yy "+yy
nnoremap ,p "+p

" move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" reselect last-pasted text
nnoremap gp `[v`]

" keep the cursor in place while joining lines
nnoremap J mzJ`z

" [S]plit line (sister to [J]oin lines) S is covered by cc.
nnoremap S mzi<CR><ESC>`z

" easier fold toggling
nnoremap ,z za

" start substitute on current word under the cursor
nnoremap ,s :%s///gc<Left><Left><Left>

" start search on current word under the cursor
nnoremap ,/ /<CR>

" start reverse search on current word under the cursor
nnoremap ,? ?<CR>

" faster sort
vnoremap ,s :!sort<CR>

" quiting and saving all
cnoremap ww wqall
cnoremap qq qall

" terminal-mode escape
tnoremap <Esc> <C-\><C-n>

" netrw explore
nnoremap <silent> <F1> :Explore<CR>

" syntax highlight refresh
nnoremap <silent> <F2> :syntax sync fromstart<CR>

" toggle fmt
nnoremap <silent> <F3> :call util#toggleFmt()<CR>

" source (reload configuration)
nnoremap <silent> <F4> :source $MYVIMRC<CR>

" toggle pastemode
nnoremap <silent> <F5> :set paste!<CR> :set nopaste?<CR>

" toggle search highlight
nnoremap <silent> <F6> :set nohlsearch!<CR> :set nohlsearch?<CR>

" toggle white characters visibility
nnoremap <silent> <F7> :set list!<CR> :set list?<CR>

" terminal
nnoremap <silent> <F8> :terminal<CR>

" Free
" nnoremap <silent> <F9>
" Free
" nnoremap <silent> <F10>
" Free
" nnoremap <silent> <F11>
" Free
" nnoremap <slient> <F12>

" buffers navigation and management
nnoremap <silent> + :bn<CR>
nnoremap <silent> _ :bp<CR>

" fugitive
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gH :Gbrowse<CR>
vnoremap <leader>gH :Gbrowse<CR>

" fzf
nnoremap <leader>o :FZF<CR>
nnoremap <leader>gg :Rg<Space>
nnoremap <silent> ,g :call util#searchCurrentWordWithRg()<CR>


" buf only delete
nnoremap ,C :call util#bufferClear()<CR>
