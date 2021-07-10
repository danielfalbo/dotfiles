au! bufwritepost $MYVIMRC source %
filetype plugin indent on
ino <c-u> <c-g>u<c-u>
ino <c-w> <c-g>u<c-w>
let &t_EI.="\e[2 q"
let &t_SI.="\e[6 q"
let &t_SR.="\e[4 q"
let &ttm=$KEYTIMEOUT
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_winsize=20
let mapleader = " "
let maplocalleader = " "
nn <leader>n <cmd>Lexplore<cr>
nn <s-tab> <cmd>bp<cr>
nn <tab> <cmd>bn<cr>
nn Y y$
nn j gj
nn k gk
set ar
set cb=unnamed
set et sw=4 ts=4 sts=4 ai si
set hid
set ic
set lbr bri
set lcs=tab:>\ ,trail:· list
set nu
set sb spr
sy on
vn < <gv
vn > >gv
