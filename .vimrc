" pathogen, load plugins in ~/.vim/bundle/
execute pathogen#infect()

" allow syntax highlighting
syntax on

" turn on:
"   1) Filetype detection
"   2) Use filetype plugins
"   3) Use filetype specific indenting
filetype plugin indent on

" enable JSX syntax in *.js files, too
let g:jsx_ext_required = 0

" enable XML tag matching
runtime macros/matchit.vim

" try really hard to allow 256 colos
set t_Co=256
" in case above didn't work
let &t_AB="\e[48;5;%dm" " set bg colo (ANSI)
let &t_AF="\e[38;5;%dm" " set fg colo (ANSI)

" default colorscheme
colorscheme maroloccio

" we use a dark terminal background provide appropriate colours
set background=dark

" support transparent bg - TODO just load all these in auto func
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

" show training whitespace as `-', and tabs as `>---'
set list lcs=trail:-,tab:>-

set hlsearch    " highlight search results
set shiftround  " shift to set columns rather than relative
set si          " use smartindent on new lines (see ':help smartindent')
set ai          " use autoindent (copy indent from prev line on new line)
set cursorline  " highlight current line (expensive)

"hi,
"here is a basic .vimrc that you can choose to use if you like.  use all/part/none of it up to you.
" Ty

" ignore case during search
set ignorecase

" obey case if search pattern has uppercase
set smartcase

" shiftwidth is 4 @ sparq
set shiftwidth=4
set tabstop=4

" expandtab, expand tabs as spaces
set expandtab

" fileformats=unix
set ffs=unix

" <Ctrl-n> to toggle line numbers
map <C-n> :set nu!<CR>
" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>
nnoremap <silent> <C-g> :echo expand('%:p')<CR><C-g>
nnoremap <silent> <C-h> :echo expand('%:{getcwd()}')<CR><C-g>

" make debugging python scripts a little less painless
nnoremap <silent> <F5> :!clear;python3.5 %<CR>
""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line (see ":help statusline")
"   \       a space
"   %F      path from home
"   %f      path for file in buffer
"   %m      modified? [+], not-modifiable? [-]
"   %r      readonly? [RO]
"   %h      is vim help? [help]
"   %w      is preview? [Preview]
"   %l      line
"   %c      column
set statusline=\ %F%m%r%h\ %w\ pos:\(%l,%c)

" code folding
set foldmethod=manual
set foldlevelstart=99 " open all folds on file open

"""
""" source macros
"""

" load filetype generic macros, settings
source ${HOME}/.vimrc.dir/macros_all.vim

" load filetype specific macros, settings
au BufNewFile,BufRead,FileType *.js* call Javascript_conf()
    function Javascript_conf()
        source ${HOME}/.vimrc.dir/macros_javascript.vim
    endfunction
au BufNewFile,BufRead,FileType *.jsx call ReactJSX_conf()
    function ReactJSX_conf()
        source ${HOME}/.vimrc.dir/macros_reactjsx.vim
    endfunction
autocmd FileType c[pp]* call Cpp_conf()
    function Cpp_conf()
        source ${HOME}/.vimrc.dir/macros_cpp.vim
    endfunction
autocmd FileType *.sh call Bash_conf()
    function Bash_conf()
        source ${HOME}/.vimrc.dir/macros_bash.vim
    endfunction
autocmd FileType *.go call Go_conf()
    function Go_conf()
        source ${HOME}/.vimrc.dir/macros_go.vim
    endfunction

" syntax highlighting like HTML for EJS files
au BufNewFile,BufRead *.ejs set filetype=html

" set explicit tab character for .at files
au BufNewFile,BufRead *.a[tm], set noic cin noexpandtab list filetype=autotest
au Filetype autotest setlocal noexpandtab list

" set syntax for golang source files
au BufNewFile,BufRead *.go set syn=go

