syntax on
colorscheme torte
filetype plugin indent on
set colorcolumn=80
set number

" Status line 
" -----------
set laststatus=2
set ruler

let mapleader = "-"


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



" Key Mappings
" ------------
nnoremap <space> viw
  "Select the current word in normal using space
nnoremap <s-k> :make
  "Invoke make using SHIFT-K
inoremap <c-u> <esc>viwU<esc>i
  "Upper case the current in insert mode using CTRL-U

nnoremap <leader>ev :vnew $MYVIMRC<cr>
  "Edit vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>
  "Source vimrc
nnoremap <leader>eb :vnew $HOME/.bashrc<cr>
  "Edit bashrc
nnoremap <leader>em :vnew ./Makefile<cr>
  "Edit project Makefile 

nnoremap <leader>d( di(
nnoremap <leader>d{ di{
nnoremap <leader>of :set foldlevel=99<cr>
nnoremap <leader>cf :set foldlevel=-1<cr>

" Git key mapping
" ---------------
nnoremap gps :!git push<cr>
nnoremap gpl :!git pull<cr>
nnoremap gco :!git checkout %<cr>
nnoremap gst :!git status<cr>
nnoremap gdf :!git difftool<cr>

"autocmd BufWritePre * :%s/ *$//g
  "Remove all the trailing spaces upon closing the file

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

" OCaml specific stuf {{{
" ------------------------
augroup filetype_ocaml
  autocmd!
  autocmd FileType ocaml setlocal shiftwidth=2 tabstop=2
  autocmd FileType ocaml :iabbrev <buffer> iif if<cr><c-d>then begin<cr>end<cr>else begin<cr>end<up><up><up><up>
  autocmd FileType ocaml :iabbrev <buffer> --> -> begin <cr>end<up><esc>$i
  autocmd FileType ocaml setlocal foldmethod=indent
  autocmd FileType ocaml setlocal foldlevel=99 
augroup end 
"}}}

" Vim filetype setting {{{
augroup filetype_vim 
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup end 
" }}}
