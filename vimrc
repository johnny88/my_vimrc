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
" Plugin 'shougo/deoplete.nvim'
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
Plugin 'nginx.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'isRuslan/vim-es6'

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

set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
set number              " show line numbers
nnoremap <C-w> :set invpaste paste?<CR>
set pastetoggle=<C-w>
set showmode

let mapleader = ","

"""""""""""""""""""""""""""""""""""
"
" Tab configuration
"
"""""""""""""""""""""""""""""""""""
nnoremap <F9> :tabnew ./<CR>
nnoremap <F3> :tabclose<CR>
nnoremap <C-j> :tabprevious<CR>
inoremap <C-j> <Esc>:tabprevious<CR>
vnoremap <C-j> <Esc>:tabprevious<CR>
nnoremap <C-k> :tabnext<CR>
inoremap <C-k> <Esc>:tabnext<CR>
vnoremap <C-k> <Esc>:tabnext<CR>

inoremap <F9> <Esc>:tabnew ./<CR>
inoremap <F3> <Esc>:tabclose<CR>
inoremap <F7> :tabprevious<CR>


inoremap <C-p> <Esc>:CtrlP<CR>
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

"""""""""""""""""""""""""""""""""""
"
" Configuring Ctrl P
"
"""""""""""""""""""""""""""""""""""
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

let g:ctrlp_open_new_file = 't'
let g:ctrlp_show_hidden = 1
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

"""""""""""""""""""""""""""""""""""
"
" setting char limit
"
"""""""""""""""""""""""""""""""""""
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" au BufWinEnter * let w:m1=matchadd('Search', '\%<81v.\%>77v', -1)
" au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)

" let g:deoplete#enable_at_startup = 1
"""""""""""""""""""""""""""""""""""
"
" Multi Line Configuration
"
"""""""""""""""""""""""""""""""""""
let g:multi_cursor_insert_maps = { 'j': 1, ',': 1 }
let g:multi_cursor_visual_maps = { 'i':1, 'a':1, 'f':1, 'F':1, 't':1, 'T':1,
  \'j': 1, ',': 1 }
