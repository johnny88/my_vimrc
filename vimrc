"""""""""""""""""""""""""""""""""""
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
Plug 'VundleVim/Vundle.vim'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'dracula/vim'
" post install (yarn install | npm install) then load plugin only for editing
" supported files
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'moll/vim-bbye'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-unimpaired'
Plug 'w0rp/ale'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'

call plug#end()            " required

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
au BufNewFile,BufRead Jenkinsfile set filetype=groovy

set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
set number              " show line numbers
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" This allows for change paste motion cp{motion}
nmap <silent> cp :set opfunc=ChangePaste<CR>g@
function! ChangePaste(type, ...)
    silent exe "normal! `[v`]\"_c"
    silent exe "normal! p"
endfunction

" include jsx in .js files
let g:jsx_ext_required = 0

" jk is escape
inoremap jk <esc>

set clipboard+=unnamed
set completeopt-=preview
if $TMUX == ''
    set clipboard+=unnamed
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

let g:lightline = {
      \ 'colorscheme': 'Dracula',
      \ }

"""""""""""""""""""""""""""""""""""
"
" Configuring Nerd Tree
"
"""""""""""""""""""""""""""""""""""
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <C-n> :NERDTreeToggle<CR>
map <Leader>n :NERDTreeFocus<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <silent> <Leader>, :exe "vertical resize " . (winwidth(0) * 8/7)<CR>
nnoremap <silent> <Leader>. :exe "vertical resize " . (winwidth(0) * 7/8)<CR>

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
" Configuring fzf
"
"""""""""""""""""""""""""""""""""""
nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore "*\.git/*" -g ""'
set rtp+=/usr/local/opt/fzf

"""""""""""""""""""""""""""""""""""
"
" Turning on Dracula theme
"
"""""""""""""""""""""""""""""""""""
syntax on
color dracula

"""""""""""""""""""""""""""""""""""
"
" Javascript Code Completion Setup
"
"""""""""""""""""""""""""""""""""""
let g:used_javascript_libs = 'react,lo-dash,flux'

"""""""""""""""""""""""""""""""""""
"
" Bbye configuration 
"
"""""""""""""""""""""""""""""""""""
nnoremap <Leader>q :Bdelete<CR>

"""""""""""""""""""""""""""""""""""
"
" ACK.VIM configuration
"
"""""""""""""""""""""""""""""""""""
" Use Silver Searcher if exists
if executable('ag')
  let g:ackprg = 'ag --hidden --ignore "*\.git/*" -F'
endif

" Don't go to first search result by default
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

"""""""""""""""""""""""""""""""""""
"
" Prettier Configuration
"
"""""""""""""""""""""""""""""""""""
" max line length that prettier will wrap on
let g:prettier#config#print_width = 80

" number of spaces per indentation level
let g:prettier#config#tab_width = 2

" use tabs over spaces
let g:prettier#config#use_tabs = 'false'

" print semicolons
let g:prettier#config#semi = 'true'

" print spaces between brackets
let g:prettier#config#bracket_spacing = 'true'
"
" single quotes over double quotes
let g:prettier#config#single_quote = 'false'
"
" put > on the last line instead of new line
let g:prettier#config#jsx_bracket_same_line = 'false'

" none|es5|all
let g:prettier#config#trailing_comma = 'none'

" flow|babylon|typescript|postcss|json|graphql
let g:prettier#config#parser = 'flow'

" cli-override|file-override|prefer-file
let g:prettier#config#config_precedence = 'cli-override'

let g:prettier#exec_cmd_path = "/usr/bin/prettier"

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md PrettierAsync

let g:prettier#config#prose_wrap = 'always'

"""""""""""""""""""""""""""""""""""
"
" bbye Configuration
"
"""""""""""""""""""""""""""""""""""
nnoremap <Leader>q :Bdelete<CR>

