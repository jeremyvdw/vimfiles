let mapleader = ","

inoremap jk <ESC>

nnoremap <Tab> :bnext<CR>         " Make tab and shift tab cycle through buffers 
nnoremap <S-Tab> :bprevious<CR>
nnoremap <F6> :noh<CR><F6>        " Make :noh a shortcut.

nmap <Leader>d :b#<bar>bd#<bar>b<CR>     " close current buffer without closing split
nmap <Leader>c :close<CR>
nmap <Leader>g gf
nmap <Leader>f :NERDTreeFind<CR>

" easy nav between windows
map <C-l> <C-W>l<C-W>_
map <C-k> <C-W>k<C-W>_
map <C-j> <C-W>j<C-W>_
map <C-h> <C-W>h<C-W>_

