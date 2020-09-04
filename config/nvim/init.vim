" Install vim-plug.
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" Install plugins.
call plug#begin('~/.config/nvim/plugged')
  " colorscheme
  Plug 'ayu-theme/ayu-vim'
  " syntax highlightings
  Plug 'sheerun/vim-polyglot'
  " automatically closing pair stuff
  Plug 'jiangmiao/auto-pairs'
  " commenting support (gc)
  Plug 'tpope/vim-commentary'
  " camelCase and snake_case motions
  Plug 'bkad/CamelCaseMotion'
  " heuristically set indent settings
  Plug 'tpope/vim-sleuth'
  " split - join multilines
  Plug 'AndrewRadev/splitjoin.vim'
  " git commit message
  Plug 'rhysd/committia.vim'
  " fzf binding
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  " airline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " autocomplete
  " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/echodoc.vim'
  " lsp
  " Plug 'autozimu/LanguageClient-neovim', {
  "       \ 'branch': 'next',
  "       \ 'do': 'bash install.sh',
  "       \ }
  " neoformat
  Plug 'sbdchd/neoformat'
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
  " obsession stores sessions
  Plug 'tpope/vim-obsession'
  " vimwiki
  Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
  " mkdir when save
  Plug 'pbrisbin/vim-mkdir'
  " unix shell moves
  Plug 'tpope/vim-eunuch'
  " cljfmt
  Plug 'tpope/vim-fireplace'
  Plug 'venantius/vim-cljfmt'
  " csv
  Plug 'chrisbra/csv.vim'
  " coc
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

set termguicolors
let ayucolor="dark"
colorscheme ayu

language en_US.utf8
set clipboard+=unnamedplus  " allow to use system clipboard
set cmdheight=1             " command line height
set cmdheight=2             " two spaces command line area height
set expandtab               " use space characters in place of tab characters
set exrc                    " folder specific configuration
set hidden                  " enables to switch between unsaved buffers and keep undo history
set ignorecase              " ignore case by default
set lazyredraw              " don't redraw while executing macros (better performance)
set matchtime=2             " how many tenths of a second to blink when matching brackets
set nohlsearch              " don't highlight after search
set nojoinspaces            " no extra space when joining a line which ends with . ? !
set noshowmode              " always show mode
set nospell                 " disable spellcheck
set nostartofline           " prevent cursor from moving to beginning of line when switching buffers
set noswapfile              " new buffers will be loaded without creating a swapfile
set notimeout               " time out on key codes but not mappings. Basically this makes terminal Vim
set nowrap                  " don't wrap lines
set number                  " line numbers on
set pumheight=10            " completion window max size
set relativenumber          " relative numbers on
set scrolloff=5             " scroll when closing to top or bottom of the screen
set shell=/bin/zsh          " setting shell to zsh
set shiftwidth=2            " two spaces when indenting
set showcmd                 " show commands as you type them
set showmatch               " show matching brackets when text indicator is over them
set signcolumn=yes          " always show signcolumns
set smartcase               " make search case sensitive only if it contains U letters
set softtabstop=2           " two spaces soft tab stop
set splitbelow              " splitting a window will put the new window below the current
set splitright              " splitting a window will put the new window right of the current
set synmaxcol=160           " don't try to syntax highlight minified files
set textwidth=99            " text width is 99 characters max
set ttimeout                " work sanely.
set ttimeoutlen=10          " (by Steve Losh)
set updatetime=1000         " update time used to create swap file or other things
set virtualedit=block       " to be able to select past EOL in visual block mode
set wrapscan                " search again from top when reached the bottom
set formatoptions-=cro      " no new line comments

let g:python_host_prog='~/.asdf/shims/python2'
let g:python3_host_prog='~/.asdf/shims/python3'

syntax on
filetype plugin on
filetype indent on

source $HOME/.config/nvim/maps.vim
source $HOME/.config/nvim/util.vim

" airline tabline
let g:airline_theme='distinguished'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = ' '

" language client
" let g:LanguageClient_serverCommands = {
"     \ 'go': ['gopls'],
"     \ 'javascript': ['javascript-typescript-stdio'],
"     \ 'javascript.jsx': ['javascript-typescript-stdio'],
"     \ 'ruby': ['solargraph', 'stdio'],
"     \ 'rust': ['rls'],
"     \ 'typescript': ['javascript-typescript-stdio'],
"     \ 'typescript.tsx': ['javascript-typescript-stdio']
"     \ }

" let g:LanguageClient_autoStart=1
" let g:LanguageClient_autoStop=1
" let g:LanguageClient_diagnosticsEnable=1
" let g:LanguageClient_loadSettings=1
" let g:LanguageClient_loggingLevel='WARN'
" let g:LanguageClient_selectionUI='fzf'

nnoremap <silent> <leader>fm :call LanguageClient_contextMenu()<CR>
nnoremap <silent> <leader>fr :call LanguageClient_textDocument_references()<CR>

" coc
nnoremap <silent> <leader>fh :call CocAction('doHover', 'drop')<CR>
nnoremap <silent> <leader>fd :call CocAction('jumpDefinition')<CR>
nnoremap <silent> <leader>ff :call CocAction('format')<CR>
nnoremap <silent> <leader>fi :call CocAction('jumpImplementation')<CR>

" enable auto pairs fly mode
let g:AutoPairsFlyMode=1
let g:AutoPairsShortcutBackInsert='<C-v>'

" enable deoplete
let g:deoplete#enable_at_startup=1

" table mode corner limiter
let g:table_mode_corner='|'

" enable neoformat debugging
let g:neoformat_verbose = 0

" enable cljfmt
let g:clj_fmt_autosave = 1

" multiple cursor highlights
highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
highlight link multiple_cursors_visual Visual

" relative on focus gained, absolute on focus lost
augroup linenumbers
  autocmd!
  autocmd BufEnter *    :set relativenumber
  autocmd BufLeave *    :set number norelativenumber
  autocmd WinEnter *    :set relativenumber
  autocmd WinLeave *    :set number norelativenumber
  autocmd InsertEnter * :set number norelativenumber
  autocmd InsertLeave * :set relativenumber
  autocmd FocusLost *   :set number norelativenumber
  autocmd FocusGained * :set relativenumber
augroup END" number stuff

" make sure Vim returns to the same line when you reopen a file.
augroup line_return
  au!
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" run checktime in buffers, but avoiding the "Command Line" (q:) window
autocmd CursorHold * if getcmdwintype() == '' | checktime | endif

" resize splits when the window is resized
autocmd VimResized * :wincmd =

" remove trailing whitespaces automatically before save
autocmd BufWritePre * call util#stripTrailingWhitespaces()
