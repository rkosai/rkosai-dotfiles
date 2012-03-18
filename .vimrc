set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
syntax on

set t_Co=256
colorscheme donbass

" Highlight bad form
:highlight BadForm ctermbg=darkred guibg=darkred
:match BadForm /\s\+$\|\t/

" Load NERDTree
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" When you leave vim, fix the terminal background to not be grey anymore
autocmd VimLeave * :highlight Normal ctermfg=black ctermbg=white

" Non-native syntax highlighting
autocmd BufNewFile,BufRead *.mxml set filetype=mxml
autocmd BufNewFile,BufRead *.as set filetype=actionscript
