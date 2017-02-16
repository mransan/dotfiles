" How to execute the current buffer/selection 
" :.w !bash 

" How to pipe the command output in the current buffer
" :r! cmd 

syntax on
colorscheme torte

filetype plugin indent on

set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set colorcolumn=80

set number

set tags+=$HOME/.ctags_cuda

cmap fb<Space> FufBuffer<CR>
cmap ff<Space> FufFile<CR>

autocmd FileType ocaml setlocal shiftwidth=2 tabstop=2
autocmd FileType html  setlocal shiftwidth=2 tabstop=2
set tw=0 wrapmargin=0

let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

augroup filetype
  au! BufRead,BufNewFile *.proto setfiletype proto
augroup end
