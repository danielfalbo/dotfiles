filetype plugin indent on

syntax on

set clipboard=unnamed

set expandtab shiftwidth=4 tabstop=4 softtabstop=4 autoindent smartindent

set linebreak breakindent

set listchars=tab:>\ ,trail:· list

set number

set splitbelow splitright

set ttimeoutlen=1

vnoremap < <gv
vnoremap > >gv

vnoremap <c-a> <c-a>gv
vnoremap <c-x> <c-x>gv

vnoremap g<c-a> g<c-a>gv
vnoremap g<c-x> g<c-x>gv

inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

nnoremap <s-tab> <cmd>bp<cr>
nnoremap <tab> <cmd>bn<cr>

nnoremap Y y$

nnoremap j gj
nnoremap k gk

autocmd! bufwritepost $MYVIMRC source $MYVIMRC

" Cursor
let &t_EI.="\e[2 q"
let &t_SI.="\e[6 q"
let &t_SR.="\e[4 q"
