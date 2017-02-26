syntax on
colorscheme torte

filetype plugin indent on

set colorcolumn=80

let mapleader = "-"

nnoremap <leader>ev :vnew $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>eb :vnew $HOME/.bashrc<cr>
nnoremap <leader>em :vnew ./Makefile<cr>
nnoremap gps :!git push<cr>
nnoremap gpl :!git pull<cr>

" Indenation
" ----------
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

" Line Wrapping 
" -------------
set linebreak
set wrap

set number

" Key Mappings
" ------------

nnoremap <space> viw
  "Select the current word in normal using space
nnoremap <s-k> :make
  "Invoke make using SHIFT-K
inoremap <c-u> <esc>viwU<esc>i 
  "Upper case the current in insert mode using CTRL-U

autocmd FileType ocaml setlocal shiftwidth=2 tabstop=2
autocmd FileType html  setlocal shiftwidth=2 tabstop=2
set tw=0 wrapmargin=0

let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

augroup filetype
  au! BufRead,BufNewFile *.proto setfiletype proto
augroup end

" Fuzzy Buffer Plugin 
" ------------------

cmap fb<Space> FufBuffer<CR>
cmap ff<Space> FufFile<CR>
