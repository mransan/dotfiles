syntax on
colorscheme torte
filetype plugin indent on
set colorcolumn=80
set number

" Make sure that autocompletion for files on disk works like in bash
set wildmode=longest,list,full
set wildmenu

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
nnoremap <leader>k ggVGd 
  "Empty the buffer"
nnoremap <leader>ex ^v$<left>y<esc>:new<cr>:r!<c-r>"<cr>
  "Shell execute the command on the line where the cursor is"


" Code folding 
" ------------
nnoremap <leader>of :set foldlevel=99<cr>
nnoremap <leader>cf :set foldlevel=-1<cr>

" Surround selection with character pair
" --------------------------------------
vnoremap <leader>"  di""<esc><left>p
vnoremap <leader>'  di''<esc><left>p
vnoremap <leader>(  di()<esc><left>p
vnoremap <leader>{  di{}<esc><left>p
vnoremap <leader>`  di``<esc><left>p

" Git key mapping
" ---------------
nnoremap gps :!git push<cr>
nnoremap gpl :!git pull<cr>
nnoremap gco :!git checkout %<cr>
nnoremap gst :!git status<cr>
nnoremap gdf :!git difftool<cr>

" Grep
" ----
nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " src"<cr>:copen<cr> 
nnoremap <leader>n :cn<cr>
nnoremap <leader>p :cN<cr>

"autocmd BufWritePre * :%s/ *$//g
  "Remove all the trailing spaces upon closing the file

set tw=0 wrapmargin=0

" let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
" execute "set rtp+=" . g:opamshare . "/merlin/vim"

augroup filetype
  au! BufRead,BufNewFile *.proto setfiletype proto
augroup end

" Fuzzy Buffer Plugin
" ------------------

cmap fb<Space> FufBuffer<CR>
cmap ff<Space> FufFile<CR>

" Wraps the current selection with the start/end OCaml comment markers, 
" ie '(*' and '*)'
function! OCamlComment()
  "the logic is to go first at the end of the section, insert the 
  "end marker, go to the beginning of the selection and insert the 
  "start marker. 
  "
  "Note that it's important to insert first the end marker so as not to 
  "corrupt the location of the start of the selection (ie '`<') 
  execute "normal! \<esc>`>a*)\<esc>`<i(*\<esc>"
endfunction

" Remove the closest start and end OCaml comment markers from the 
" cursor location. 
"
" Note that this function does not handle correctly nested comments. 
"
"          (* blah blah (* foo foo *) blah *)
"                                     ^
"                                   cursor
" The example above would not work
function! OCamlUnComment()
  let saved_unnamed_register = @a 

  "select the entire comment including the start/end markers by 
  "searching first backward for the marker '(*' and then forward for the 
  "'*)' marker. 
  "
  "Note that this methodology is not robust enough to handle nested 
  "comments.
  execute "normal! ?(\\*\<cr>v/\\*)\<cr>\<right>\<esc>"

  "select the content of the comment (excluding the start/end markers)
  execute "normal!  `<\<right>\<right>v`>\<left>\<left>"

  "copy the selected content, delete the comment start and end markers, 
  "paste the comment content
  execute "normal! \"ad\<esc>\<left>\<left>xxxx\"aP\<esc>"

  let @a = saved_unnamed_register

endfunction

" OCaml specific stuf {{{
" ------------------------
augroup filetype_ocaml
  autocmd!
  autocmd FileType ocaml setlocal shiftwidth=2 tabstop=2
  autocmd FileType ocaml :iabbrev <buffer> iif if<cr><c-d>then begin<cr>end<cr>else begin<cr>end<up><up><up><up>
  autocmd FileType ocaml :iabbrev <buffer> --> -> begin <cr>end<up><esc>$i
  autocmd FileType ocaml setlocal foldmethod=indent
  autocmd FileType ocaml setlocal foldlevel=99 
  autocmd FileType ocaml :vnoremap <buffer> <leader>c :<c-u>call OCamlComment()<cr>
  autocmd FileType ocaml :nnoremap <buffer> <leader>x :<c-u>call OCamlUnComment()<cr>
augroup end 
"}}}

" Vim filetype setting {{{
augroup filetype_vim 
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup end 
" }}}

"
" Javascript specific stuff {{{
" -----------------------------
function! JsDev()
  nnoremap <leader>t :!npm run test<cr>
  nnoremap <leader>s :!npm run start<cr>
  nnoremap <leader>b :!npm run build<cr>
endfunction

augroup js
  autocmd!
  autocmd BufReadPre .babelrc setlocal filetype=json
augroup end 
