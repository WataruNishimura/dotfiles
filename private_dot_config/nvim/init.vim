set number
set expandtab
set smartindent
set shiftwidth=2
set softtabstop=2
set encoding=utf-8

syntax enable

map <C-c> <Esc>

inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap [ []<Left>
