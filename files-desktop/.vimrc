"VimPlug
call plug#begin('~/.vim/plugged')
    Plug 'sheerun/vim-polyglot'
    Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
    Plug 'dylanaraps/wal.vim'
    Plug 'vimwiki/vimwiki'
call plug#end()

"LaTeX
filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
autocmd Filetype tex setlocal nofoldenable
let g:Tex_ViewRule_pdf = 'evince'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_pdf = 'latexmk -c -pdf -f $*'
set iskeyword+=:
set cmdheight=2
"Live latex
let g:livepreview_previewer = 'evince'
set updatetime=1000

"Omnicomplete
"filetype plugin on
set omnifunc=syntaxcomplete#Complete

"Line numbers
set number relativenumber

"Mouse
set mouse=a

"Clipboard
set clipboard=unnamedplus

"Ignore case
set ic!

"Line wrap
set breakindent
set linebreak

"Smart command tab
set nocompatible
set wildmenu
set wildmode=full

"4 spaces tabs
set expandtab
set ts=4
set sw=4

"RGB
"colors monokai
syntax enable
hi Normal ctermbg=NONE
colorscheme wal

"SwapWords
" :call SwapWords({'foo':'bar'})
function! Mirror(dict)
    for [key, value] in items(a:dict)
        let a:dict[value] = key
    endfor
    return a:dict
endfunction
function! S(number)
    return submatch(a:number)
endfunction
function! SwapWords(dict, ...)
    let words = keys(a:dict) + values(a:dict)
    let words = map(words, 'escape(v:val, "|")')
    if(a:0 == 1)
        let delimiter = a:1
    else
        let delimiter = '/'
    endif
    let pattern = '\v(' . join(words, '|') . ')'
    exe '%s' . delimiter . pattern . delimiter
        \ . '\=' . string(Mirror(a:dict)) . '[S(0)]'
        \ . delimiter . 'g'
endfunction
