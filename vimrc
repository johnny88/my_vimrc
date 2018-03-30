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
"
" Themes
Plug 'dracula/vim'
Plug 'flazz/vim-colorschemes'

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
Plug 'jiangmiao/auto-pairs'
Plug 'jparise/vim-graphql'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'edkolev/tmuxline.vim'

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

" Supporting Vue files with multiple different comment types
let g:ft = ''
fu! NERDCommenter_before()
  if &ft == 'vue'
    let g:ft = 'vue'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        let syn = tolower(syn)
        exe 'setf '.syn
      endif
    endif
  endif
endfu
fu! NERDCommenter_after()
  if g:ft == 'vue'
    setf vue
    g:ft
  endif
endfu

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
" Turning on theme
"
"""""""""""""""""""""""""""""""""""
syntax on
colorscheme dracula

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

let g:prettier#config#print_width = 80
let g:prettier#config#tab_width = 2
let g:prettier#config#semi = 'false'
let g:prettier#config#use_tabs = 'false'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#config#trailing_comma = 'none'
let g:prettier#config#parser = 'flow'
let g:prettier#config#config_precedence = 'cli-override'
let g:prettier#exec_cmd_path = "/usr/bin/prettier"
let g:prettier#config#prose_wrap = 'always'

let g:prettier#autoformat = 0
autocmd BufWritePre *.md PrettierAsync
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md PrettierAsync


let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '>',
    \ 'right' : '',
    \ 'right_alt' : '<',
    \ 'space' : ' '}


