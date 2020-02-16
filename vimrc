call plug#begin('~/.vim/plugged')

" Vim improvement plugins
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'

" Theme
Plug 'morhetz/gruvbox'

" Buffer Management and search
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Linting and Completion
Plug 'dense-analysis/ale'

call plug#end()

"""""""""""""""""""""""""""""""""""
"
" General config
"
"""""""""""""""""""""""""""""""""""
let mapleader = ","
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
set number
set mouse=a
set backupcopy=yes

" map leader x to close extra windows
noremap <Leader>x :ccl <bar> lcl<CR>

" map leader y and p to paste buffer
set clipboard+=unnamedplus

"""""""""""""""""""""""""""""""""""
" 
" Theming
"
"""""""""""""""""""""""""""""""""""
set background=dark
colorscheme gruvbox
hi Normal ctermbg=none

"""""""""""""""""""""""""""""""""""
"
" JSX
"
"""""""""""""""""""""""""""""""""""
let g:jsx_ext_required = 0

augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.tsx set filetype=typescript.tsx
augroup END

"""""""""""""""""""""""""""""""""""
"
" Splits
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

"""""""""""""""""""""""""""""""""""
"
" Nerd commenter config
"
"""""""""""""""""""""""""""""""""""
let g:NERDSpaceDelims = 1

"""""""""""""""""""""""""""""""""""
"
" Configuring Ale
"
"""""""""""""""""""""""""""""""""""
let g:ale_fixers = {
  \ 'typescript': ['eslint'],
  \ 'javascript': ['eslint'],
  \ 'go': ['gofmt', 'goimports']
\}

let g:ale_linters = {
  \'typescript': ['tsserver', 'eslint'],
  \'javascript': ['eslint'],
  \ 'go': ['golint', 'govet', 'gopls'],
\}

let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1

nmap <Leader>d :ALEGoToDefinition<CR>
nmap <Leader>i :ALEHover<CR>
