set nocompatible              " be iMproved, required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'cespare/vim-toml'
Plugin 'rust-lang/rust.vim'

"--- SPACING AND TABS ---
set tabstop=2                " number of visual spaces per TABa
set softtabstop=2            " number of spaces in tab when editing
set expandtab                " tabs are spaces

"--- UI CONFIG ---
set number                   " show line numbers
filetype indent on           " load filetype-specific indent filesa
set wildmenu                 " visual autocomplete for command menu
set lazyredraw               " redraw only when we need to.
set showmatch                " highlight matching [{()}]

"--- SEARCH ---
set incsearch                " search as characters are entered
set hlsearch                 " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

"--- MOVEMENT ---
" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" highlight last inserted text
nnoremap gV `[v`]

"--- LEADER SHORTCUT ---
let mapleader=","       " leader is comma

" jk is escape
inoremap jk <esc>

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>a

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

nnoremap <leader>nt :tabedit
nnoremap <leader>ct :tabclose<CR>
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

filetype plugin on
syntax on

