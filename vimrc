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
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdcommenter'
Plugin 'nginx.vim'
Plugin 'dracula/vim'
Plugin 'prettier/vim-prettier'
Plugin 'moll/vim-bbye'
Plugin 'sheerun/vim-polyglot'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-unimpaired'
Plugin 'w0rp/ale'
Plugin 'tpope/vim-repeat'

call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""
"
" Some general config
"
"""""""""""""""""""""""""""""""""""
let mapleader = ","
set hlsearch
syntax enable           " enable syntax processing
filetype on             " enable filetype checking
au BufNewFile,BufRead Jenkinsfile set filetype=groovy

set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
set number              " show line numbers
nnoremap <Leader>z :set invpaste paste?<CR>
set pastetoggle=<Leader>z
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
let g:AutoPairsShortcutFastWrap = '<C-b>'

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
" Configuring vim airline
"
"""""""""""""""""""""""""""""""""""
set laststatus=2

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
  let g:ackprg = 'ag --vimgrep'
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
let g:prettier#config#single_quote = 'true'
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

