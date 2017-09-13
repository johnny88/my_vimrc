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
" Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
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
" Plugin 'terryma/vim-multiple-cursors'
Plugin 'isRuslan/vim-es6'
Plugin 'dracula/vim'
Plugin 'prettier/vim-prettier'
Plugin 'elixir-lang/vim-elixir'
Plugin 'rust-lang/rust.vim'
Plugin 'cespare/vim-toml'
Plugin 'rking/ag.vim'
Plugin 'moll/vim-bbye'

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
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

let mapleader = ","
" This allows for change paste motion cp{motion}
nmap <silent> cp :set opfunc=ChangePaste<CR>g@
function! ChangePaste(type, ...)
    silent exe "normal! `[v`]\"_c"
    silent exe "normal! p"
endfunction

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
" Movement configuration
"
"""""""""""""""""""""""""""""""""""
set hidden
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

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
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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
" let g:ctrlp_prompt_mappings = {
    " \ 'acceptselection("e")': ['<c-t>'],
    " \ 'acceptselection("t")': ['<cr>', '<2-leftmouse>'],
    " \ }

let g:ctrlp_open_new_file = 'b'
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
" AG.VIM configuration
"
"""""""""""""""""""""""""""""""""""
let g:ag_working_path_mode="r"
