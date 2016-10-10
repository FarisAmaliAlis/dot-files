"-------------------------------------------------------------------------------
" Loosing all hope was freedom -- Tyler Durden
"
" @author Faris Amali Alis
" @version 1.0
"-------------------------------------------------------------------------------

" ==============================================================================
" Plugin manager (Plug) settings
" ==============================================================================

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" START-OF-PLUG
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ------------------------------------------------------------------------------
" Language related plugins
" ------------------------------------------------------------------------------

" Asynchronous maker and linter (needs linters to work)
Plug 'benekastah/neomake', { 'on': ['Neomake'] }
" Automatically closing pair stuff
Plug 'cohama/lexima.vim'
" Commenting support (gc)
Plug 'tpope/vim-commentary'
" CamelCase and snake_case motions
Plug 'bkad/CamelCaseMotion'
" Heuristically set indent settings
Plug 'tpope/vim-sleuth'
" Highlighting for all
Plug 'sheerun/vim-polyglot'
" Happy endings
Plug 'tpope/vim-endwise'
" Replace selection with paste
Plug 'vim-scripts/ReplaceWithRegister'
" Split - Join multilines
Plug 'AndrewRadev/splitjoin.vim'
" Easymotion
Plug 'easymotion/vim-easymotion'

" ------------------------------------------------------------------------------
" Productivity plugins
" ------------------------------------------------------------------------------

" Running tests with different ganularities
Plug 'janko-m/vim-test'
" Neoterm
Plug 'kassio/neoterm'
" VTR
Plug 'christoomey/vim-tmux-runner'
" Hardtime
Plug 'takac/vim-hardtime'

" ------------------------------------------------------------------------------
" Fuzzy searcher
" ------------------------------------------------------------------------------

" fzf binding
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'

" ------------------------------------------------------------------------------
" Interface uplift
" ------------------------------------------------------------------------------

" Nerdtree file browser
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeFind', 'NERDTreeToggle'] }
" Lightline
Plug 'itchyny/lightline.vim'
" Buffers tabline
Plug 'ap/vim-buftabline'

" ------------------------------------------------------------------------------
" Colorschemes
" ------------------------------------------------------------------------------

" Tender
Plug 'jacoborus/tender'
" WWDC
Plug 'lifepillar/vim-wwdc16-theme'
" Gotham
Plug 'whatyouhide/vim-gotham'

" ------------------------------------------------------------------------------
" Utilities
" ------------------------------------------------------------------------------

" Delete all but current buffer
Plug 'vim-scripts/BufOnly.vim', { 'on': 'Bonly' }
" Intelligent buffer closing
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
" Fugitive
Plug 'tpope/vim-fugitive'
" Surround (cs"')
Plug 'tpope/vim-surround'
" Matchit enhances jump motions
Plug 'edsono/vim-matchit'
" vim + tmux clipboard
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'roxma/vim-tmux-clipboard'
" Gitgutterz
Plug 'airblade/vim-gitgutter'
" Multiple cursors
Plug 'terryma/vim-multiple-cursors'

call plug#end()

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" END-OF-PLUG
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" ==============================================================================
" Basic settings
" ==============================================================================

set shell=/bin/zsh        " Setting shell to zsh
set number                " Line numbers on
set noshowmode            " Always show mode
set showcmd               " Show commands as you type them
set textwidth=120         " Text width is 120 characters
set cmdheight=1           " Command line height
set pumheight=10          " Completion window max size
set noswapfile            " New buffers will be loaded without creating a swapfile
set hidden                " Enables to switch between unsaved buffers and keep undo history
set clipboard+=unnamed    " Allow to use system clipboard
set lazyredraw            " Don't redraw while executing macros (better performance)
set showmatch             " Show matching brackets when text indicator is over them
set matchtime=2           " How many tenths of a second to blink when matching brackets
set nostartofline         " Prevent cursor from moving to beginning of line when switching buffers
set virtualedit=block     " To be able to select past EOL in visual block mode
set nojoinspaces          " No extra space when joining a line which ends with . ? !
set scrolloff=5           " Scroll when closing to top or bottom of the screen
set updatetime=1000       " Update time used to create swap file or other things
set suffixesadd+=.js,.rb  " Add js and ruby files to suffixes
set synmaxcol=160         " Don't try to syntax highlight minified files
set nowrap                " Don't wrap lines
set expandtab             " Use space characters in place of tab characters
set tabstop=8             " Two spaces when tabbing
set softtabstop=4         " Two spaces soft tab stop
set shiftwidth=4          " Two spaces when indenting
set shiftround            " Round indent to nearest shiftwidth multiple

" ==============================================================================
" Split settings
" ==============================================================================

set splitbelow " Splitting a window will put the new window below the current
set splitright " Splitting a window will put the new window right of the current

" ==============================================================================
" Timeout settings
" ==============================================================================

" Time out on key codes but not mappings. Basically this makes terminal Vim
" work sanely. (by Steve Losh)
set notimeout
set ttimeout
set ttimeoutlen=10

" ==============================================================================
" Spelling settings
" ==============================================================================

set nospell

" ==============================================================================
" Search settings
" ==============================================================================

set ignorecase " Ignore case by default
set smartcase  " Make search case sensitive only if it contains U letters
set wrapscan   " Search again from top when reached the bottom
set nohlsearch " Don't highlight after search

" ==============================================================================
" Filetype settings
" ==============================================================================

filetype plugin on
filetype indent on

" ==============================================================================
" Colorscheme + Highlighting settings
" ==============================================================================

syntax enable
colorscheme gotham

" Highlight Visual mode
hi visual guifg=white guibg=lightblue gui=none

" Link highlight groups to improve buftabline color
hi! link BufTabLineCurrent TabLineSel
hi! link BufTabLineActive PmenuSel
hi! link BufTabLineHidden TabLine
hi! link BufTabLineFill TabLineFill

" Lonsistent SignColumn
hi clear SignColumn


" ==============================================================================
" Syntax Settings
" ==============================================================================

" Haskell
" Highlighting
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`

" Indentation
let g:haskell_indent_if=3
let g:haskell_indent_case=2
let g:haskell_indent_let=4
let g:haskell_indent_where=6
let g:haskell_indent_do=3
let g:haskell_indent_in=1
let g:haskell_indent_guard=2

" ==============================================================================
" Neovim specific settings
" ==============================================================================

let g:loaded_python_provider=1                    " Disable python 2 interface
let g:python_host_skip_check=1                    " Skip python 2 host check
let g:python3_host_prog='/usr/local/bin/python3'  " Set python 3 host program

if has('termguicolors')
 set termguicolors " Turn on true colors support
endif

" ==============================================================================
" Mappings
" ==============================================================================

" ------------------------------------------------------------------------------
" Leader
" ------------------------------------------------------------------------------

let g:mapleader="\<space>"
imap jk <Esc>

" ------------------------------------------------------------------------------
" Insane Defaults
" ------------------------------------------------------------------------------

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

" ------------------------------------------------------------------------------
" Insane Overrides
" ------------------------------------------------------------------------------

" Easier window switching
nmap <silent> <C-w><C-w> :call utils#intelligentCycling()<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Visual linewise up and down by default (and use gj gk to go quicker)
nnoremap j gj
nnoremap k gk
nnoremap gj 5j
nnoremap gk 5k
vnoremap j gj
vnoremap k gk
vnoremap gj 5j
vnoremap gk 5k

" When jump to next match also center screen
nnoremap <silent> n :norm! nzz<CR>
nnoremap <silent> N :norm! Nzz<CR>
vnoremap <silent> n :norm! nzz<CR>
vnoremap <silent> N :norm! Nzz<CR>

" Same when moving up and down
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz
vnoremap <C-u> <C-u>zz
vnoremap <C-d> <C-d>zz
vnoremap <C-f> <C-f>zz
vnoremap <C-b> <C-b>zz

" Remap H and L (top, bottom of screen to left and right end of line)
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L g_

" More logical Y (default was alias for yy)
nnoremap Y y$

" Don't yank to default register when changing something
nnoremap c "xc
xnoremap c "xc

" After block yank and paste, move cursor to the end of operated text and don't override register
vnoremap y y`]
vnoremap p "_dP`]
nnoremap p p`]

" Use CamelCaseMotion instead of default motions
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

" Fix the cw at the end of line bug default vim has special treatment (:help cw)
nmap cw ce
nmap dw de

" Uppercase word in insert mode
inoremap <C-u> <ESC>mzgUiw`za

" Matching brackets with TAB (using matchit) (Breaks the <C-i> jump)
map <TAB> %
silent! unmap [%
silent! unmap ]%

" Don't cancel visual select when shifting
xnoremap <  <gv
xnoremap >  >gv

" Make . work with visually selected lines
xnoremap . :norm.<CR>

" ------------------------------------------------------------------------------
" Common tasks
" ------------------------------------------------------------------------------

" Quick save and close buffer
nnoremap ,w :w<CR>
nnoremap <silent> ,c :Sayonara!<CR>
nnoremap <silent> ,q :Sayonara<CR>

" Yank and paste from clipboard
nnoremap ,y "+y
vnoremap ,y "+y
nnoremap ,yy "+yy
nnoremap ,p "+p

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Tags generation / navigation (:tselect to select from menu)
nnoremap ]t :tn<CR>
nnoremap [t :tp<CR>
nnoremap ,ts :ts<CR>
nnoremap ,tg :GTags<CR>

" QuickFix navigation
nnoremap ]q :cnext<CR>
nnoremap [q :cprevious<CR>

" Location list navigation
nnoremap ]l :lnext<CR>
nnoremap [l :lprevious<CR>

" Error mnemonic (Neomake uses location list)
nnoremap ]e :lnext<CR>
nnoremap [e :lprevious<CR>

" Reselect last-pasted text
nnoremap gp `[v`]

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" [S]plit line (sister to [J]oin lines) S is covered by cc.
nnoremap S mzi<CR><ESC>`z

" Easier fold toggling
nnoremap ,z za

" Start substitute on current word under the cursor
nnoremap ,s :%s///gc<Left><Left><Left>

" Start search on current word under the cursor
nnoremap ,/ /<CR>

" Start reverse search on current word under the cursor
nnoremap ,? ?<CR>

" Faster sort
vnoremap ,s :!sort<CR>

" Quiting and saving all
cnoremap ww wqall
cnoremap qq qall

" ------------------------------------------------------------------------------
" F-key actions
" ------------------------------------------------------------------------------

" NERDTree wrapper
nnoremap <silent> <F1> :call utils#nerdWrapper()<CR>
" Free
" nnoremap <silent> <F2>
" Free
" nnoremap <silent> <F3>
" Toggle pastemode
nnoremap <silent> <F4> :set paste!<CR> :set nopaste?<CR>
" Source (reload configuration)
nnoremap <silent> <F5> :source $MYNVIMRC<CR>
" Toggle search highlight
nnoremap <silent> <F6> :set nohlsearch!<CR> :set nohlsearch?<CR>
" Toggle white characters visibility
nnoremap <silent> <F7> :set list!<CR> :set list?<CR>
" New term buffer
nnoremap <silent> <F8> :terminal<CR>
" Free
" nnoremap <silent> <F9>
" Free
" nnoremap <silent> <F10>
" Free
" nnoremap <silent> <F11>
" Free
" nnoremap <slient> <F12>

" ------------------------------------------------------------------------------
" Buffer management
" ------------------------------------------------------------------------------

" Intelligent windows resizing using ctrl + arrow keys
nnoremap <silent> <C-Right> :call utils#intelligentVerticalResize('right')<CR>
nnoremap <silent> <C-Left> :call utils#intelligentVerticalResize('left')<CR>
nnoremap <silent> <C-Up> :resize +1<CR>
nnoremap <silent> <C-Down> :resize -1<CR>

" Buffers navigation and management
nnoremap <silent> + :bn<CR>
nnoremap <silent> _ :bp<CR>

" ==============================================================================
" Plugin settings
" ==============================================================================

" ------------------------------------------------------------------------------
" Neomake
" ------------------------------------------------------------------------------

let g:neomake_verbose=0
let g:neomake_warning_sign = {
      \ 'text': '►',
      \ 'texthl': 'WarningMsg',
      \ }
let g:neomake_error_sign = {
      \ 'text': '✖︎',
      \ 'texthl': 'ErrorMsg',
      \ }

" ------------------------------------------------------------------------------
" Vim-test + VTR
" ------------------------------------------------------------------------------

" vim-test maps
map <silent> <leader>t :TestNearest<CR>
map <silent> <leader>f :TestFile<CR>
map <silent> <leader>T :TestSuite<CR>
map <silent> <leader>r :TestLast<CR>
map <silent> <leader>g :TestVisit<CR>

" run tests with :T
let test#strategy = "vtr"

" vertical split instead of the default horizontal
" let g:neoterm_position = "horizontal"

" vtr maps
nnoremap <leader>fr :VtrFocusRunner<cr>
nnoremap <leader>kr :VtrKillRunner<cr>
nnoremap <leader>rr :VtrSendLinesToRunner<cr>
nnoremap <leader>dr :VtrSendCtrlD<cr>
nnoremap <leader>ar :VtrAttachToPane<cr>

" ------------------------------------------------------------------------------
" Lightline
" ------------------------------------------------------------------------------

let g:lightline = {
      \ 'colorscheme': 'gotham',
      \ 'tab': {
      \   'active': [ 'filename' ],
      \   'inactive': [ 'filename' ]
      \ },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename' ] ],
      \   'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'filetype', 'fileencoding', 'fileformat' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"HELP":&readonly?"RO":""}'
      \ },
      \ 'component_function': {
      \   'mode': 'utils#lightLineMode',
      \   'filename': 'utils#lightLineFilename',
      \   'filetype': 'utils#lightLineFiletype',
      \   'fileformat': 'utils#lightLineFileformat',
      \   'fileencoding': 'utils#lightLineFileencoding'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&readonly)'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

" ------------------------------------------------------------------------------
" Fugitive
" ------------------------------------------------------------------------------

nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gH :Gbrowse<CR>

" ------------------------------------------------------------------------------
" NERDTree
" ------------------------------------------------------------------------------

let g:NERDTreeMinimalUI=1
let g:NERDTreeWinSize=40
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeShowHidden=1
let g:NERDTreeHighlightCursorline=0
let g:NERDTreeRespectWildIgnore=1

" ------------------------------------------------------------------------------
" FZF
" ------------------------------------------------------------------------------

let g:fzf_layout = { 'down': '~30%'}

nnoremap <leader>o :FZF<CR>
nnoremap <leader>gg :Ag<Space>
nnoremap <silent> ,g :call utils#searchCurrentWordWithAg()<CR>

" ------------------------------------------------------------------------------
" BufTabLine
" ------------------------------------------------------------------------------

let g:buftabline_numbers=2

" ------------------------------------------------------------------------------
" BufOnly
" ------------------------------------------------------------------------------

nnoremap ,C :Bonly<CR>

" ==============================================================================
" Autocommands
" ==============================================================================

" Remove trailing whitespaces automatically before save
autocmd BufWritePre * call utils#stripTrailingWhitespaces()

" Resize splits when the window is resized {{{
autocmd VimResized * :wincmd =

" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
  au!
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" Run checktime in buffers, but avoiding the "Command Line" (q:) window
autocmd CursorHold * if getcmdwintype() == '' | checktime | endif

" Place a dummy sign column
autocmd BufEnter * sign define dummy
autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')

" ------------------------------------------------------------------------------
" Linters
" ------------------------------------------------------------------------------

" npm install -g standard
" autocmd BufWritePost *.js,*.jsx Neomake standard
" npm install -g eslint
" autocmd BufWritePost *.js Neomake eslint
" gem install rubocop
" autocmd BufWritePost *.rb Neomake rubocop
" brew install elixir
" autocmd BufWritePost *.ex,*.exs Neomake elixir
