" Vundle {{{
""""""""""""

"filetype controls required for compatibility with vundle
set nocompatible
filetype off

" Linux mode
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" Vundle
Plugin 'gmarik/vundle'

" Languages
Plugin 'w0rp/ale'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" Themes
Plugin 'crusoexia/vim-monokai'

" Navigation
Plugin 'scrooloose/nerdtree'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'itchyny/lightline.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'ap/vim-buftabline'
Plugin 'christoomey/vim-tmux-navigator'

" Snippets
Plugin 'garbas/vim-snipmate'
Plugin 'marcweber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'

call vundle#end()
filetype plugin indent on

" CtrlP
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_working_path_mode='r'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_custom_ignore = 'node_modules\|.git'

" Tmux Navigator
let g:tmux_navigator_no_mappings = 1

" NERDTree
let NERDTreeShowHidden = 1

" Set tags where vim is opened
set tags=.tags

"}}}

" Vim Settings {{{
""""""""""

" Enable the mouse
set mouse=a
set ttymouse=xterm2

" Use the system clipboard as default register
set clipboard=unnamed

" Implies fast connection, set notf if remote
set ttyfast

" Disable redraw while executing macros
set lazyredraw

" Use backups, swapfiles, undofiles
set nobackup
set noswapfile
set undofile
set undodir=~/.vim/undo//

" Disable Ex mode
nnoremap Q <nop>

" Disable keywordprg
nnoremap K <nop>

" Disable modeline
set nomodeline

" Allow movement away from modified buffers
set hidden

" UTF-8 encoding
set encoding=utf-8

" Spell check with en_gb
set spelllang=en_gb

" Create long history
set history=10000

" Left and right to new lines
set whichwrap+=<,>,h,l

" Split panes below and to the right
set splitbelow
set splitright

" Return to last edit position when opening files
augroup edit_memory
    autocmd!
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
augroup end

" Default settings for tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set shiftround

" Give backspace its common usage
set backspace=eol,start,indent

" Colour syntax
syntax enable

colorscheme monokai

set guioptions=

" Fold column
set number
set foldcolumn=2

" Fold settings
set foldlevel=99
set foldnestmax=3

" Command bar setup
set showcmd
set cmdheight=2

" Visual autocomplete in menu
set wildmenu
set wildmode=list:longest,full

" Highlight partnering brace
set showmatch

" Different highlights on braces
highlight MatchParen cterm=none ctermbg=none ctermfg=magenta

" Special character settings
set nolist
set listchars=eol:$,tab:▸\ ,trail:~,extends:>,precedes:<

" Wrap text, keep words whole
set wrap
set linebreak

" No maximum width for inserted text
set textwidth=0
set wrapmargin=0

" Always show status bar on last window
set laststatus=2

" Offset scrolling
set scrolloff=3

" Display show mode, handled by airline
set noshowmode

" Less error feedback
set noerrorbells
set novisualbell

" Search highlighting
set hlsearch
set incsearch

" Search case insensitive
set ignorecase

" Automatically load lastest version of file if modified
set autoread

" End Section }}}

" Vim Maps {{{
""""""""""

" Press jk to escape insert mode
inoremap jk <esc>

" Space as mapleader
let mapleader="\<space>"

" Toggle NERDTree, seems not to work if up top.
nnoremap <leader>; :NERDTreeToggle<cr>

" Move by display line
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" Map fold toggle
nnoremap <leader><leader> zA

" Clear the search
nnoremap <leader>/ :let@/=""<cr>

" Buffer navigation
" noremap <silent> <tab> :bnext<cr>
" nnoremap <silent> <s-tab> :bprevious<cr>
" noremap <silent> <c-n> :bnext<cr>
" noremap <silent> <c-p> :bprevious<cr>
" nnoremap <silent> <leader>bd :bdelete<cr>
" 
nnoremap gt :bnext<cr>
nnoremap gT :bprevious<cr>
nnoremap gd :bd<cr>

" File management
nnoremap <leader>w :w<cr>
nnoremap <leader>wq :wq<cr>
nnoremap <leader>W :wall<cr>
nnoremap <silent> <leader>q :quit<cr>
nnoremap <silent> <leader>Q :quit!<cr>

" Tab Split
nnoremap <leader>s :tab split<cr>

" Window navigation
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>

" Window creation
nnoremap <silent> <leader>" :split<cr> "seems to be interacting with registers
nnoremap <silent> <leader>% :vsplit<cr>

" Testrunner
nnoremap <silent> <leader>t :Make<cr>
nnoremap <silent> <leader>T :make<cr>

" Quickfix navigation
noremap <silent> <leader>. :cnext<cr>
noremap <silent> <leader>, :cprevious<cr>
noremap <silent> <F8> :cnext<cr>
noremap <silent> <s-F8> :cprevious<cr>

" View reset
nnoremap <silent> <leader>r :cclose<cr>:pclose<cr>:lclose<cr>:NERDTreeClose<cr>

" Present only current buffer
nnoremap <silent> <leader>o :only<cr>

" File shortcuts
nnoremap <silent> <leader>ev :e $MYVIMRC<cr>
nnoremap <silent> <leader>el :e ~/.vim/ftplugin<cr>

" }}}


" Autoresize to make buffer windows equal size if application is resized
if has('autocmd')
    augroup WincentAutocmds
        autocmd!

        autocmd VimResized * execute normal! \<c-w>="
    augroup end
endif

" FileTypes {{{

" }}}
