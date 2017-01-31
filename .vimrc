set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'isruslan/vim-es6'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax enable           " enable syntax processing
set tabstop=4 shiftwidth=4 shiftwidth=4 noexpandtab
set number              " show line numbers
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

nnoremap <F9> :tabnew ./<CR>
nnoremap <F3> :tabclose<CR>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
inoremap <F9> <Esc>:tabnew ./<CR>
inoremap <F3> <Esc>:tabclose<CR>
inoremap <F7> :tabprevious<CR>
inoremap <F8> :tabnext<CR>
nnoremap <C-/> <leader>c <CR>

" include jsx in .js files
let g:jsx_ext_required = 0

" jk is escape
inoremap jk <esc>
set clipboard+=unnamed
