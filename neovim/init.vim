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
" colorscheme
Plug 'tyrannicaltoucan/vim-quantum'
" automatically closing pair stuff
Plug 'jiangmiao/auto-pairs'
" commenting support (gc)
Plug 'tpope/vim-commentary'
" camelCase and snake_case motions
Plug 'bkad/CamelCaseMotion'
" heuristically set indent settings
Plug 'tpope/vim-sleuth'
" highlighting for all
Plug 'sheerun/vim-polyglot'
" replace selection with paste
Plug 'vim-scripts/ReplaceWithRegister'
" split - join multilines
Plug 'AndrewRadev/splitjoin.vim'
" easymotion
Plug 'easymotion/vim-easymotion'
" ale (Linting Engine)
Plug 'w0rp/ale'
" neoformat
Plug 'sbdchd/neoformat'
" emmet
Plug 'mattn/emmet-vim'
" git commit message
Plug 'rhysd/committia.vim'
" fzf binding
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
" nerdtree file browser
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeFind', 'NERDTreeToggle'] }
" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" buffer surfer
Plug 'ton/vim-bufsurf'
" autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/echodoc.vim'
" lsp
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
" delete all but current buffer
Plug 'vim-scripts/BufOnly.vim', { 'on': 'Bonly' }
" intelligent buffer closing
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
" fugitive
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
" surround (cs"')
Plug 'tpope/vim-surround'
" matchit enhances jump motion
Plug 'tmhedberg/matchit'
" vim + tmux clipboard
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'roxma/vim-tmux-clipboard'
" gitgutter
Plug 'airblade/vim-gitgutter'
" table-mode
Plug 'dhruvasagar/vim-table-mode'
" multiple cursors
Plug 'terryma/vim-multiple-cursors'
" wakatime
Plug 'wakatime/vim-wakatime'
" vimwiki
Plug 'vimwiki/vimwiki'

call plug#end()

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" END-OF-PLUG
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" ==============================================================================
" Basic settings
" ==============================================================================

language en_US
set shell=/bin/zsh        " Setting shell to zsh
set number                " Line numbers on
set noshowmode            " Always show mode
set showcmd               " Show commands as you type them
set textwidth=125         " Text width is 125 characters
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
set softtabstop=2         " Two spaces soft tab stop
set shiftwidth=2          " Two spaces when indenting
set cmdheight=2           " Two spaces command line area height
set signcolumn=yes        " Always show signcolumns
set exrc                  " Folder specific configuration
set splitbelow            " Splitting a window will put the new window below the current
set splitright            " Splitting a window will put the new window right of the current
set notimeout             " Time out on key codes but not mappings. Basically this makes terminal Vim
set ttimeout              " work sanely.
set ttimeoutlen=10        " (by Steve Losh)
set nospell               " Disable spellcheck
set ignorecase            " Ignore case by default
set smartcase             " Make search case sensitive only if it contains U letters
set wrapscan              " Search again from top when reached the bottom
set nohlsearch            " Don't highlight after search

" ==============================================================================
" Filetype settings
" ==============================================================================

syntax on
filetype plugin on
filetype indent on

" ==============================================================================
" Neovim specific settings
" ==============================================================================

let g:loaded_python_provider=1                    " Disable python 2 interface
let g:python_host_skip_check=1                    " Skip python 2 host check
let g:python_host_prog='/usr/local/bin/python2'   " Set python 2 host program
let g:python3_host_prog='/usr/local/bin/python3'  " Set python 3 host program

if has('termguicolors')
  set termguicolors " Turn on true colors support
endif

" ==============================================================================
" Colorscheme + Highlighting settings
" ==============================================================================

let g:quantum_black=1
colorscheme quantum

" ==============================================================================
" Mappings
" ==============================================================================

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

" easier window switching
nmap <silent> <C-w><C-w> :call utils#intelligentCycling()<CR>

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

" ------------------------------------------------------------------------------
" F-key actions
" ------------------------------------------------------------------------------

" toggle NERDTree
nnoremap <silent> <F1> :call utils#nerdWrapper()<CR>
" Toggle tagbar
" nnoremap <silent> <F2> :TagbarToggle<CR>
" Toggle fmt
nnoremap <silent> <F3> :call utils#toggleFmt()<CR>
" Source (reload configuration)
nnoremap <silent> <F4> :source $MYVIMRC<CR>
" Toggle pastemode
nnoremap <silent> <F5> :set paste!<CR> :set nopaste?<CR>
" Toggle search highlight
nnoremap <silent> <F6> :set nohlsearch!<CR> :set nohlsearch?<CR>
" Toggle white characters visibility
nnoremap <silent> <F7> :set list!<CR> :set list?<CR>
" Free
" nnoremap <silent> <F8>
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
" nnoremap <silent> <C-Right> :call utils#intelligentVerticalResize('right')<CR>
" nnoremap <silent> <C-Left> :call utils#intelligentVerticalResize('left')<CR>
" nnoremap <silent> <C-Up> :resize +1<CR>
" nnoremap <silent> <C-Down> :resize -1<CR>

" Buffers navigation and management
nnoremap <silent> + :BufSurfForward<CR>
nnoremap <silent> _ :BufSurfBack<CR>

" ==============================================================================
" Plugin settings
" ==============================================================================

" ------------------------------------------------------------------------------
" Gitgutter
" ------------------------------------------------------------------------------

" let g:gitgutter_sign_added='xx'
" let g:gitgutter_sign_modified='yy'
" let g:gitgutter_sign_removed='zz'
" let g:gitgutter_sign_removed_first_line='^^'
" let g:gitgutter_sign_modified_removed='ww'

" ------------------------------------------------------------------------------
" Airline
" ------------------------------------------------------------------------------

let g:airline_theme='minimalist'

" ------------------------------------------------------------------------------
" Fugitive
" ------------------------------------------------------------------------------

nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gH :Gbrowse<CR>
vnoremap <leader>gH :Gbrowse<CR>

" ------------------------------------------------------------------------------
" NERDTree
" ------------------------------------------------------------------------------

let g:NERDTreeMinimalUI=1
let g:NERDTreeWinSize=40
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeShowHidden=1
let g:NERDTreeHighlightCursorline=0
let g:NERDTreeRespectWildIgnore=1
let g:NERDTreeIgnore=['node_modules$[[dir]]']
let g:NERDTreeSortOrder=['\/$','^\.','^[a-z]','^[A-Z]']

" ------------------------------------------------------------------------------
" FZF
" ------------------------------------------------------------------------------

let g:fzf_layout = { 'down': '~30%'}

nnoremap <leader>o :FZF<CR>
nnoremap <leader>gg :Ag<Space>
nnoremap <silent> ,g :call utils#searchCurrentWordWithAg()<CR>

" ------------------------------------------------------------------------------
" BufOnly
" ------------------------------------------------------------------------------

nnoremap ,C :Bonly<CR>

" ------------------------------------------------------------------------------
" Auto Pairs
" ------------------------------------------------------------------------------

let g:AutoPairsFlyMode=1
let g:AutoPairsShortcutBackInsert='<C-v>'

" ------------------------------------------------------------------------------
" ALE
" ------------------------------------------------------------------------------

let g:ale_enabled=0
let g:ale_lint_on_text_changed='never'
let g:ale_lint_on_enter=0
let g:ale_completion_enabled=0

" ------------------------------------------------------------------------------
" Deoplete
" ------------------------------------------------------------------------------

let g:deoplete#enable_at_startup=1

" ------------------------------------------------------------------------------
" Polyglot
" ------------------------------------------------------------------------------

let g:javascript_plugin_flow=1

" ------------------------------------------------------------------------------
" LanguageClient
" ------------------------------------------------------------------------------

let g:LanguageClient_serverCommands = {
    \ 'c': ['cquery', '--log-file=/tmp/cq.log'],
    \ 'cpp': ['cquery', '--log-file=/tmp/cq.log'],
    \ 'go': ['go-langserver'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'typescript': ['javascript-typescript-stdio']
    \ }

let g:LanguageClient_autoStart=1
let g:LanguageClient_autoStop=1
let g:LanguageClient_diagnosticsEnable=1
let g:LanguageClient_loadSettings=1
let g:LanguageClient_loggingLevel='WARN'
let g:LanguageClient_selectionUI='fzf'

nnoremap <silent> <leader>fm :call LanguageClient_contextMenu()<CR>
nnoremap <silent> <leader>fs :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> <leader>fd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <leader>fr :call LanguageClient_textDocument_references()<CR>
nnoremap <silent> <leader>ff :call LanguageClient_textDocument_formatting()<CR>
nnoremap <silent> <leader>fi :call LanguageClient_textDocument_implementation()<CR>

" ------------------------------------------------------------------------------
" vim-multiple-cursors
" ------------------------------------------------------------------------------

highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
highlight link multiple_cursors_visual Visual

" ------------------------------------------------------------------------------
" Table Mode
" ------------------------------------------------------------------------------

let g:table_mode_corner='|'

" ------------------------------------------------------------------------------
" Vimwiki
" ------------------------------------------------------------------------------

let g:vimwiki_list = [{
    \ 'path': '~/.org/',
    \ 'diary_rel_path': 'journal/',
    \ 'diary_index': 'journal' }]

" ==============================================================================
" Autocommands
" ==============================================================================

" remove trailing whitespaces automatically before save
autocmd BufWritePre * call utils#stripTrailingWhitespaces()

" resize splits when the window is resized
autocmd VimResized * :wincmd =

" prettier settings
autocmd FileType javascript setlocal
      \ formatprg=prettier\ --stdin\ --parser=flow\ --single-quote\ --print-width=125\

" run checktime in buffers, but avoiding the "Command Line" (q:) window
autocmd CursorHold * if getcmdwintype() == '' | checktime | endif

" make sure Vim returns to the same line when you reopen a file.
augroup line_return
  au!
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" aug autopairs to not auto close on rust's lifetime syntax
augroup vimrc-rust-autopairs
  autocmd!
  autocmd FileType rust let g:AutoPairs = {'(':')', '[':']', '{':'}','"':'"', '`':'`'}
augroup END
