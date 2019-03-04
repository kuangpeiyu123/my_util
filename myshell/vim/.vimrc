set nocompatible
set backspace=indent,eol,start
set nu
set sw=4
set ts=4
set expandtab "tab空格4个"
set ai
set si
set ruler " always show current position in lower right corner
set showcmd
set showmatch
set smartindent
syntax on
filetype plugin indent on

"if has("multi_type")
set encoding=utf-8 "强制utf8"
set termencoding=utf-8
set formatoptions+=mM
set fencs=utf-8,gbk
"endif

"colorscheme darkblue
set tags+=/root/.vim/systags
set tags+=./tags
"set autochdir
" search related options
set hlsearch
set incsearch
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
       set csprg=/usr/local/bin/cscope
       set csto=1
       set cst
       set nocsverb
       " add any database in current directory
       if filereadable("cscope.out")
           cs add cscope.out
       endif
       set csverb
endif

map <F3> :NERDTreeToggle<CR>
map <F3> <ESC> :NERDTreeToggle<CR>

nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"python
let python_highlight_all=1
au Filetype python set tabstop=4
au Filetype python set softtabstop=4
au Filetype python set shiftwidth=4
au Filetype python set textwidth=79
au Filetype python set expandtab
au Filetype python set autoindent
au Filetype python set fileformat=unix
autocmd Filetype python set foldmethod=indent
autocmd Filetype python set foldlevel=99

"map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
        exec "w"
        if &filetype == 'c'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'cpp'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'java'
                exec "!javac %"
                exec "!time java %<"
        elseif &filetype == 'sh'
                :!time bash %
        elseif &filetype == 'python'
                exec "!clear"
                exec "!time python3 %"
        elseif &filetype == 'html'
                exec "!firefox % &"
        elseif &filetype == 'go'
                " exec "!go build %<"
                exec "!time go run %"
        elseif &filetype == 'mkd'
                exec "!~/.vim/markdown.pl % > %.html &"
                exec "!firefox %.html &"
        endif
endfunc

set pastetoggle=<F10>
let g:ackprg = 'ag --nogroup --nocolor --column'                                                                                         
let g:ackhighlight = 1
map <c-u> :Ack<space>
map <F5> :set invlist<CR>
"map <F6> :set nolist<CR>
