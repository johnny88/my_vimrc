""""""""""""""""""""""""""""""""""
"
" Install vim-plug
"
"""""""""""""""""""""""""""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"""""""""""""""""""""""""""""""""""
"
" Setting up plug
"
"""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required

call plug#begin('~/.vim/plugged')

" Plugins
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'  }

" Themes
" Plug 'dracula/vim'
Plug 'Rigellute/rigel'
Plug 'morhetz/gruvbox'

Plug 'sheerun/vim-polyglot'
let g:fzf_install = 'yes | ./install'
Plug 'junegunn/fzf', { 'do': g:fzf_install }
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-sensible'
Plug 'jiangmiao/auto-pairs'
"Plug 'ycm-core/YouCompleteMe', { 'for': 'javascript', 'do': './install.py --ts-completer' }
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'tpope/vim-rsi'

call plug#end()            " required

let g:deoplete#enable_at_startup = 1
"call deoplete#custom#option('sources', {
"\ '_': ['ale'],
"\})
"""""""""""""""""""""""""""""""""""
"
" Some general config
"
"""""""""""""""""""""""""""""""""""
set encoding=utf-8
let mapleader = ","
set hlsearch
syntax enable           " enable syntax processing
filetype on             " enable filetype checking

set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
set number              " show line numbers
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
set mouse=a
set ttymouse=sgr
set backupcopy=yes

" include jsx in .js files
let g:jsx_ext_required = 0

" jk is escape
inoremap jk <esc>

if has('linux')
  set clipboard=unnamedplus
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
" Configuring lightline
"
"""""""""""""""""""""""""""""""""""
set laststatus=2
set noshowmode
let g:lightline = { 'colorscheme': 'gruvbox'  }

"let g:gruvbox_contrast_dark = 'hard'

"""""""""""""""""""""""""""""""""""
"
" Configuring Nerd Tree
"
"""""""""""""""""""""""""""""""""""
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <C-n> :NERDTreeToggle<CR>
map <Leader>n :NERDTreeFocus<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"""""""""""""""""""""""""""""""""""
"
" Configuring fzf
"
"""""""""""""""""""""""""""""""""""
nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>

set rtp+=/usr/local/opt/fzf

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
" Configuring Ale
"
"""""""""""""""""""""""""""""""""""
let g:ale_go_gofmt_options = '-w'
let g:ale_fixers = {'typescript': ['eslint'], 'javascript': ['eslint'], 'go': ['gofmt', 'goimports']}
let g:ale_linters = {'typescript': ['eslint'], 'javascript': ['eslint'], 'go': ['gopls']}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0

"""""""""""""""""""""""""""""""""""
"
" Configuring You Complete Me
"
"""""""""""""""""""""""""""""""""""
"nnoremap <leader>jd :YcmCompleter GoTo<CR>
