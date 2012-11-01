set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
syntax on

set t_Co=256
let g:lucius_style="light"
colorscheme lucius

set splitright

" Enable filetype plugins for python
autocmd BufNewFile,BufRead *.py :filetype plugin on

" Highlight 81st column
:set textwidth=80
:set colorcolumn=+1,+2,+3

" Highlight bad form
autocmd BufNewFile,BufRead * :highlight BadForm ctermbg=darkred guibg=darkred
autocmd BufNewFile,BufRead * :match BadForm /\s\+$\|\t/

" Load NERDTree
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" Non-native syntax highlighting
autocmd BufNewFile,BufRead *.mxml set filetype=mxml
autocmd BufNewFile,BufRead *.as set filetype=actionscript

" When you leave vim, fix the terminal background to not be grey anymore
autocmd VimLeave * :highlight Normal ctermfg=black ctermbg=white


