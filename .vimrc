" Vundle {{{
""""""""""""

"filetype controls required for compatibility with vundle
set nocompatible
filetype off

" Linux mode
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" Bundles
Plugin 'airblade/vim-gitgutter'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'fatih/vim-go'
Plugin 'gmarik/vundle'
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'scrooloose/syntastic'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'

call vundle#end()
filetype plugin indent on

" CtrlP
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_working_path_mode='r'
let g:ctrlp_map = '<c-p>'
" nnoremap <leader>. :CtrlPTag

" GitGutter
let g:gitgutter_enabled=0
let g:gitgutter_realtime=0
let g:gitgutter_eager=0
let g:gitgutter_map_keys=0

" NerdTree
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeChDirMode=2
let g:NERDTreeHijackNetrw=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeShowBookmarks=1
noremap <c-t> :NERDTreeToggle<cr>

" Syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_python_python_exec="python"

" Tmux Navigator
let g:tmux_navigator_no_mappings = 1

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
"set backupdir=~/.vim/backup//
"set directory=~/.vim/swp//
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
colorscheme desert

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

" Visual mode support for * and #
vnoremap <silent> * :call VisualSelection('f','')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

" End Section }}}

" Vim Maps {{{
""""""""""

" Press jk to escape insert mode
inoremap jk <esc>

" Space as mapleader
let mapleader="\<space>"

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
noremap <silent> <c-n> :bnext<cr>
" noremap <silent> <c-p> :bprevious<cr>
nnoremap <silent> <leader>bd :bdelete<cr>

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

" View reset
nnoremap <silent> <leader>r :cclose<cr>:pclose<cr>:lclose<cr>:NERDTreeClose<cr>

" File shortcuts
nnoremap <silent> <leader>ev :e $MYVIMRC<cr>
nnoremap <silent> <leader>el :e ~/.vim/ftplugin<cr>

" Delete swapfile
nnoremap <leader>sd :call DeleteSwapfile()<cr>

" }}}

" Helpers {{{

" Automatically reload .vimrc on save
augroup reload
	autocmd!
	autocmd BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup end

function! DeleteSwapfile()
    let l:filename = $HOME."/.vim/swp/".substitute(expand('%:p'), '/', '%', 'g').'.swp'
    if filereadable(l:filename)
        call delete(l:filename)
        echo "swapfile deleted"
    else
       echo "no swapfile present"
    endif
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ag \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

function! CycleColours()
   let currDir = getcwd()
   exec "cd $VIMRUNTIME/colors"
   for myCol in split(glob("*"), '\n')
      if myCol =~ '\.vim'
         let mycol = substitute(myCol, '\.vim', '', '')
         exec "colorscheme " . mycol
         exec "redraw!"
         echo "colorscheme = ". myCol
         sleep 2
      endif
   endfor
   exec "cd " . currDir
endfunction

" }}}
