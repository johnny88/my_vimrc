"""""""""""""""""""""""""""""""""""
"
" Setting up plug
"
"""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'

Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/denite.nvim'

Plug 'sheerun/vim-polyglot'
let g:fzf_install = 'yes | ./install'
Plug 'junegunn/fzf', { 'do': g:fzf_install }
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'

" Themes
Plug 'morhetz/gruvbox'
  
call plug#end()

"""""""""""""""""""""""""""""""""""
"
" General Config
"
"""""""""""""""""""""""""""""""""""

set encoding=utf-8
let mapleader = ","
set hlsearch
syntax enable           " enable syntax processing
filetype on             " enable filetype checking
set number

set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
set mouse=a
set backupcopy=yes

" jk is escape
inoremap jk <esc>

if has('unix')
  set clipboard+=unnamedplus
elseif has('macunix') 
  set clipboard=unnamed
endif

"""""""""""""""""""""""""""""""""""
"
" Movement configuration
"
"""""""""""""""""""""""""""""""""""
set hidden
set splitbelow
set splitright

"""""""""""""""""""""""""""""""""""
"
" Turning on theme
"
"""""""""""""""""""""""""""""""""""
syntax on
colorscheme gruvbox
set background=dark    " Setting dark mode"
highlight Normal ctermbg=None

"""""""""""""""""""""""""""""""""""
"
" Configuring fzf
"
"""""""""""""""""""""""""""""""""""
nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>

"""""""""""""""""""""""""""""""""""
"
" Configuring Nerd Tree
"
"""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>
map <Leader>n :NERDTreeFocus<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"""""""""""""""""""""""""""""""""""
"
" Configuring Typscript
"
"""""""""""""""""""""""""""""""""""
let g:nvim_typescript#type_info_on_hold = 1
let g:deoplete#enable_at_startup = 1
let g:nvim_typescript#suggestions_enabled = 1

"""""""""""""""""""""""""""""""""""
"
" Configuring Ale
"
"""""""""""""""""""""""""""""""""""
"call deoplete#custom#option('sources', {
"\ '_': ['ale', 'foobar'],
"\})
let g:ale_go_gofmt_options = '-w'
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tsserver', 'eslint'],
\   'go': ['gopls']
\}
let g:ale_fixers = {'typescript': ['eslint'], 'javascript': ['eslint'], }
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_completion_tsserver_autoimport = 1
