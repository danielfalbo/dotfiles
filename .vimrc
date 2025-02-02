syntax sync fromstart
syntax on
set background=dark

map 4 $
nnoremap yy 0y$
vmap q <gv
vmap <TAB> >gv
vmap < <gv
vmap > >gv

set softtabstop=4
set shiftwidth=4
set expandtab

set incsearch		" incremental search
set ignorecase		" ignore the case
set smartcase		" don't ignore the case if the pattern is uppercase
set laststatus=2	" show the status bar even with one buffer
set ruler		" show cursor position
set showmode		" show the current mode
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
