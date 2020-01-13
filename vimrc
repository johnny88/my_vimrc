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
"
"""""""""""""""""""""""""""""""""""
"
" Setting up plug
"
"""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required

call plug#begin('~/.vim/plugged')

" Plugins
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-sensible'
" Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline'

" Language Plugins
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'  }
Plug 'sheerun/vim-polyglot'
Plug 'hashivim/vim-terraform'

let g:fzf_install = 'yes | ./install'
Plug 'junegunn/fzf', { 'do': g:fzf_install }
Plug 'junegunn/fzf.vim'

" Completion
Plug 'zxqfl/tabnine-vim'

" Linting
Plug 'dense-analysis/ale'

Plug 'morhetz/gruvbox'
call plug#end()

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

augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.tsx set filetype=typescript.tsx
augroup END

" jk is escape
inoremap jk <esc>

if has('linux')
  set clipboard=unnamedplus
elseif has('macunix')
  set clipboard=unnamed
endif

syntax on
set background=dark
colorscheme gruvbox
let g:jsx_ext_required = 0 
augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

" map leader x to close extra windows
noremap <Leader>x :ccl <bar> lcl<CR>
" remove scratch preview
set completeopt-=preview
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
" Configuring Nerd Tree
"
"""""""""""""""""""""""""""""""""""

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
" Terraform config
"
"""""""""""""""""""""""""""""""""""
let g:terraform_fmt_on_save=1

"""""""""""""""""""""""""""""""""""
"
" Nerd commenter config
"
"""""""""""""""""""""""""""""""""""
let g:NERDSpaceDelims = 1

"""""""""""""""""""""""""""""""""""
"
" Go vim config
"
"""""""""""""""""""""""""""""""""""
" Edit it Improvements
" https://github.com/fatih/vim-go/wiki/Tutorial#vimrc-improvements-3
let g:go_fmt_command = "goimports"

" Check it
" https://github.com/fatih/vim-go/wiki/Tutorial#check-it
let g:go_metalinter_autosave = 0

" Understand it
" https://github.com/fatih/vim-go/wiki/Tutorial#identifier-resolution
autocmd FileType go nmap <Leader>i <Plug>(go-info)
let g:go_list_height = 0

"""""""""""""""""""""""""""""""""""
"
" Configuring Ale
"
"""""""""""""""""""""""""""""""""""
let g:ale_fixers = {
  \ 'typescript': ['eslint'],
  \ 'javascript': ['eslint'],
\}

let g:ale_linters = {
  \'typescript': ['tsserver', 'eslint'],
  \'javascript': ['eslint'],
  \ 'go': ['golint', 'govet']
\}

let g:ale_fix_on_save = 1
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
