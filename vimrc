" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible' " defaults

Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
"Plug 'airblade/vim-gitgutter'
"Plug 'ekalinin/Dockerfile.vim' " dockerfile highlight support
Plug 'kien/ctrlp.vim' " file navigation search like sublimetext
Plug 'bling/vim-airline' " bottom line optics
Plug 'editorconfig/editorconfig-vim'
Plug 'PreserveNoEOL'  " for editorconfig insert_final_newline

" clojure stuff
Plug 'vim-scripts/VimClojure'
"Plug 'tpope/vim-salve'
"Plug 'tpope/vim-projectionist'
"Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fireplace'

" colorschemes
"Plug 'flazz/vim-colorschemes'
"Plug 'jnurmine/Zenburn'
"Plug 'chriskempson/vim-tomorrow-theme'
Plug 'altercation/vim-colors-solarized'

call plug#end()

set autoindent

" no swp files and stuff
set noswapfile
set nobackup
set nowritebackup

set hlsearch        " highlight search term

" case only matters with mixed case expressions
set ignorecase
set smartcase

" Line Numbers
set number
set numberwidth=3

" Display whitespace
set list
set listchars=tab:▸\ ,trail:·,nbsp:·

" Softtabs, 2 spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Color scheme
let g:solarized_termcolors=256
set t_Co=256
set background=dark
colorscheme solarized

if has("autocmd")

  augroup vimrcEx
    au!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal g`\"" |
          \ endif

  augroup END

endif

" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor\ --ignore-dir=tmp\ --ignore-dir=cover
endif

" disable help
nmap <F1> <Esc>

let g:ctrlp_custom_ignore = '\.pyc$\|\.beam$\'
let g:ctrlp_working_path_mode = 'r' " only show files of current repository
