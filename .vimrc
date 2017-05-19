"""""""""""""""""""""""""""""""""""
"
" Setting up vundle
"
"""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'othree/yajs.vim'
" Plugin 'valloric/youcompleteme'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'groovy.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'

call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""
"
" Some general config
"
"""""""""""""""""""""""""""""""""""
set hlsearch
syntax enable           " enable syntax processing
filetype on             " enable filetype checking
au BufNewFile,BufRead Jenkinsfile set filetype=groovy

set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
set number              " show line numbers
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

let mapleader = ","

"""""""""""""""""""""""""""""""""""
"
" Tab configuration
"
"""""""""""""""""""""""""""""""""""
nnoremap <F9> :tabnew ./<CR>
nnoremap <F3> :tabclose<CR>
nnoremap <C-S-Left> :tabprevious<CR>
nnoremap <C-S-Right> :tabnext<CR>
inoremap <F9> <Esc>:tabnew ./<CR>
inoremap <F3> <Esc>:tabclose<CR>
inoremap <F7> :tabprevious<CR>


" include jsx in .js files
let g:jsx_ext_required = 0

" jk is escape
inoremap jk <esc>
set clipboard+=unnamed
set completeopt-=preview
let g:AutoPairsShortcutFastWrap = '<C-b>'

"""""""""""""""""""""""""""""""""""
"
" Configuring Syntastic
"
"""""""""""""""""""""""""""""""""""
let g:syntastic_mode_map = { 'mode': 'active',
                            \ 'active_filetypes': ['javascript'],
                            \ 'passive_filetypes': [] }

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_loc_list_height = 3

"""""""""""""""""""""""""""""""""""
"
" Configuring vim airline
"
"""""""""""""""""""""""""""""""""""
set laststatus=2

"""""""""""""""""""""""""""""""""""
"
" Configuring Nerd Tree
"
"""""""""""""""""""""""""""""""""""
let NERDTreeShowHidden=1

"""""""""""""""""""""""""""""""""""
"
" Configuring Nerd Commenter
"
"""""""""""""""""""""""""""""""""""
filetype plugin on

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
