filetype plugin indent on

syntax on

set clipboard=unnamed

set expandtab shiftwidth=4 tabstop=4 softtabstop=4 autoindent smartindent

set linebreak breakindent

set listchars=tab:>\ ,trail:· list

set splitbelow splitright

set ttimeoutlen=1

set nu

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

nnoremap Q @q

nnoremap <c-w>- :call RepeatResize('-')<cr>
nnoremap <c-w>+ :call RepeatResize('+')<cr>
nnoremap <c-w>< :call RepeatResize('<')<cr>
nnoremap <c-w>> :call RepeatResize('>')<cr>

function! RepeatResize(first)
    let l:command = a:first
    while stridx('+-><', l:command) != -1
        execute "normal! \<C-w>" . l:command
        redraw
        let l:command = nr2char(getchar())
    endwhile
endfunction

autocmd! bufwritepost $MYVIMRC source $MYVIMRC

colorscheme habamax
hi Normal ctermbg=NONE

let s:hidden_all=0
function! ToggleFocusMode() abort
    if s:hidden_all==0
        let s:hidden_all=1
        set noshowmode
        set showtabline=0
        set foldcolumn=12
        set signcolumn=yes
        set numberwidth=20
        hi LineNr ctermfg=0
        hi EndOfBuffer ctermfg=0
    else
        let s:hidden_all=0
        set showmode
        set showtabline=2
        set foldcolumn=0
        set signcolumn=auto
        set numberwidth=4
        hi LineNr ctermfg=240
        hi EndOfBuffer ctermfg=240
    endif
endfunction

nnoremap <space> <nop>
let mapleader=" "

nnoremap <silent> <leader>h :call ToggleFocusMode()<cr>
call ToggleFocusMode()

" Cursor
let &t_EI.="\e[2 q"
let &t_SI.="\e[6 q"
let &t_SR.="\e[4 q"
