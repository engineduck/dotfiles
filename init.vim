"set termguicolors

call plug#begin('~/.local/share/nvim/plugged')

" Expand region
Plug 'terryma/vim-expand-region'

" Bottom line optics
Plug 'bling/vim-airline'

" Colors
Plug 'iCyMind/NeoSolarized'

" Code completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Ctrl + P to open files
Plug 'ctrlpvim/ctrlp.vim'

" Clojure
Plug 'clojure-vim/acid.nvim'

call plug#end()

set autoindent

" Colors
set background=dark
colorscheme NeoSolarized

" No swp files
set noswapfile
set nobackup
set nowritebackup

" Line numbers
set number
set numberwidth=3

" Softtabs, 2 spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Display tabs and trailing whitespace
set list
set listchars=tab:▸\ ,trail:·,nbsp:·

" Ignore case in search
set ignorecase
"" use case if search term contains uppercase symbol
set smartcase

" disable help
nmap <F1> <Esc>

" Expand region with v
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Autocomplete
let g:deoplete#enable_at_startup = 1

" ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" stop that window from popping up
map q: :q

" leader is space
nnoremap <Space> <nop>
let mapleader="\<Space>"
