syntax sync fromstart
syntax on
set background=dark

map 4 $
vmap q <gv
vmap <TAB> >gv
vmap < <gv
vmap > >gv

nmap j gj
nmap k gk

nmap Y y$

set softtabstop=4
set shiftwidth=4
set expandtab

set incsearch		" incremental search
set ignorecase		" ignore the case
set smartcase		" don't ignore the case if the pattern is uppercase
set laststatus=2	" show the status bar even with one buffer
set ruler		" show cursor position
set autoindent
set backspace=2

" When open a new file remember the cursor position of the last editing
if has("autocmd")
        " When editing a file, always jump to the last cursor position
        autocmd BufReadPost * if line("'\"") | exe "'\"" | endif
endif

let loaded_matchparen = 1   " Avoid the loading of match paren plugin
:filetype plugin on 

hi User1 ctermfg=green ctermbg=black
hi User2 ctermfg=yellow ctermbg=black
hi User3 ctermfg=red ctermbg=black
hi User4 ctermfg=blue ctermbg=black
hi User5 ctermfg=white ctermbg=black

set statusline=
set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%5*%{&ff}%*            "file format
set statusline +=%3*%y%*                "file type
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines

set clipboard=unnamed                   " macOS system clipboard

set number                              " Show line numbers
set numberwidth=5                       " Width of the line number column

highlight LineNr ctermfg=grey ctermbg=NONE         " Grey line numbers
highlight CursorLineNr ctermfg=yellow ctermbg=NONE " Highlight current line number

set cursorline                                " Highlight the current line
highlight CursorLine cterm=NONE ctermbg=234   " Dark grey background
highlight CursorLineNr cterm=NONE             " Remove underline from current line number

set showtabline=2                              " Always show tab bar
highlight TabLineSel ctermfg=yellow ctermbg=236

nnoremap <TAB> :tabnext<CR>
nnoremap <S-TAB> :tabprevious<CR>

" Make :e open in new tab
cabbrev e tabe
" Provide :E as an alternative to preserve original :e behavior
cabbrev E e

function! MyTabLine()
    let s = ''
    for i in range(tabpagenr('$'))
        " select the highlighting
        if i + 1 == tabpagenr()
            let s .= '%#TabLineSel#'
        else
            let s .= '%#TabLine#'
        endif

        " set the tab page number (for mouse clicks)
        let s .= '%' . (i + 1) . 'T'

        " the label is made by MyTabLabel()
        let s .= ' ' . (i + 1) . ':' . '%{MyTabLabel(' . (i + 1) . ')} '
    endfor

    " after the last tab fill with TabLineFill and reset tab page nr
    let s .= '%#TabLineFill#%T'
    return s
endfunction

function! MyTabLabel(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    let name = bufname(buflist[winnr - 1])
    return fnamemodify(name, ':t') != '' ? fnamemodify(name, ':t') : '[No Name]'
endfunction

" use cursor shape as mode indicator
set noshowmode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
set ttimeoutlen=1

" netrw
let g:netrw_liststyle = 3                       " tree-like listing
let g:netrw_banner = 0                          " hide banner at the top
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'  " show hidden files
let g:netrw_winsize = 20                        " vertical split window width
let g:netrw_browse_split = 4                    " open files in vertical split
function! ToggleNetrw()
    if exists("t:netrw_buf") && bufwinnr(t:netrw_buf) != -1
        exec bufwinnr(t:netrw_buf) . 'wincmd q'
        unlet t:netrw_buf
    else
        :Vex
        let t:netrw_buf = bufnr('%')
    endif
endfunction
nnoremap <C-e> :call ToggleNetrw()<CR>
