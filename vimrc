" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

"--------- Vundle Stuff
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'airblade/vim-gitgutter'
"Plugin 'ekalinin/Dockerfile.vim' " dockerfile highlight support
Plugin 'kien/ctrlp.vim' " file navigation search like sublimetext
Plugin 'bling/vim-airline' " bottom line optics
Plugin 'editorconfig/editorconfig-vim'
Plugin 'PreserveNoEOL'  " for editorconfig insert_final_newline

" clojure stuff
Plugin 'vim-scripts/VimClojure'
"Plugin 'tpope/vim-salve'
"Plugin 'tpope/vim-projectionist'
"Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fireplace'

" colorschemes
"Plugin 'flazz/vim-colorschemes'
Plugin 'jnurmine/Zenburn'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'altercation/vim-colors-solarized'

call vundle#end()

"--------- End Vundle Stuff


" Auto reload .vimrc after editing it
autocmd! bufwritepost .vimrc source %

syntax on  " syntax highlighting

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" no swp files and stuff
set noswapfile
set nobackup
set nowritebackup

set history=50      " keep 50 lines of command line history
set ruler           " always show cursor position
set laststatus=2    " always show status line
set showcmd         " show incomplete commands
set ttimeoutlen=0

set hlsearch        " highlight search term
set incsearch       " do incremental searching
set encoding=utf-8

" case only matters with mixed case expressions
set ignorecase
set smartcase

" Line Numbers
set number
set numberwidth=3

" Display whitespace
set list
set listchars=tab:▸\ ,trail:·,nbsp:·

" Highlight characters in lines longer than 80 chars
match Error /\%81v.\+/

" Softtabs, 2 spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" set nowrap      " no line wrapping

" Color scheme
set background=dark
colorscheme solarized
set t_Co=256

" set gitgutter column to use background color
highlight clear SignColumn

if has("autocmd")
  " Enable file type detection.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Set file type for .txt to text
  autocmd BufNewFile,BufRead *.txt setfiletype text

  " Enable soft-wrapping for text files
  autocmd FileType text,markdown,html,xhtml,eruby setlocal wrap linebreak nolist

  augroup vimrcEx
    au!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal g`\"" |
          \ endif

    " Auto reload .vimrc after editing it
    autocmd! bufwritepost .vimrc source %

  augroup END

else
  set autoindent
endif

" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor\ --ignore-dir=tmp\ --ignore-dir=cover
endif

" disable help
nmap <F1> <Esc>


let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#whitespace#enabled = 0

let g:ctrlp_custom_ignore = '\.pyc$\|\.beam$\'
let g:ctrlp_working_path_mode = 'r' " only show files of current repository
