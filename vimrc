" ------------------------------------------------------------------------------
"          FILE: .vimrc
"   DESCRIPTION: Vim configuration file. Based heavily on Sorin Ionescu's.
"        AUTHOR: Christopher Chow (chris at chowie dot net)
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
" General Settings
" ------------------------------------------------------------------------------
inoremap jk <ESC>

let mapleader = ","
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

command! W :w                     " Seriously, it's not like :W is bound
                                  " to anything anyway.
set nocompatible                  " Turn off vi compatibility.
set undolevels=1000               " Large undo levels.
set history=50                    " Size of command history.
set encoding=utf8                 " Always use unicode.
set clipboard+=unnamed            " Share the clipboard.
set backspace=indent,eol,start    " Fix backspace.
set nobackup                      " No backups
set nowritebackup
set noswapfile
set undofile

"if version > 7.2
"set noundofile                " Don't save undo tree.
"endif

set pastetoggle=<F5>              " Paste with sane indentation.
set spelllang=en_us,fr            " Set spell check language.

nnoremap <Tab> :bnext<CR>         " Make tab and shift tab cycle through buffers 
nnoremap <S-Tab> :bprevious<CR>
nnoremap <F6> :noh<CR><F6>        " Make :noh a shortcut.

nmap ,d :b#<bar>bd#<bar>b<CR>     " close current buffer without closing split


" ------------------------------------------------------------------------------
" Search and Replace
" ------------------------------------------------------------------------------
set incsearch                     " Show partial matches as search is entered.
set hlsearch                      " Highlight search patterns.
set ignorecase                    " Enable case insensitive search.
set smartcase                     " Disable case insensitivity if mixed case.
set wrapscan                      " Wrap to top of buffer when searching.
set gdefault                      " Make search and replace global by default.


" ------------------------------------------------------------------------------
" White Space
" ------------------------------------------------------------------------------
set tabstop=2                     " Set tab to equal 4 spaces.
set softtabstop=2                 " Set soft tabs equal to 4 spaces.
set shiftwidth=2                  " Set auto indent spacing.
set shiftround                    " Shift to the next round tab stop.
set expandtab                     " Expand tabs into spaces.
set smarttab                      " Insert spaces in front of lines.


" ------------------------------------------------------------------------------
" Presentation
" ------------------------------------------------------------------------------
set shortmess=aIoO                " Show short messages, no intro.
set ttyfast                       " Fast scrolling when on a decent connection.
set wrap                          " Wrap text.
set showcmd                       " Show last command.
set ruler                         " Show the cursor position.
set laststatus=2                  " Show status bar with filename
set relativenumber                " Show how far a line is from current line.
set hidden                        " Allow hidden buffers.
set showmatch                     " Show matching parenthesis.
set matchpairs+=<:>               " Pairs to match.
set cursorline                    " Highlight the current line.
set number                        " Show line numbers.
set cmdheight=2                   " Make command line height to 2 lines.
set cf                            " Enable error jumping.

nnoremap j gj
nnoremap k gk

imap <C-BS> <C-W>

" ------------------------------------------------------------------------------
" User Interface
" ------------------------------------------------------------------------------

" Set color for line highlight.
"hi CursorLine cterm=NONE ctermbg=black

" Custom colours for completion menu.
" hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=lightgray
" hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
" hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE
 
if has("gui_running")
    set guioptions-=m             " Disable menu bar.
    set guioptions-=T             " Disable the tool bar bar.
    set guioptions-=l             " Disable left scrollbar.
    set guioptions-=L             " Disable left scrollbar when split.
    set guioptions-=r             " Diable right scrollbar.
    set guioptions-=a             " Do not auto copy selection to clipboard.

    " If MacVim do some specific things.
    if has('gui_macvim')
        colorscheme railscasts            " Railscasts colour scheme.
        set guifont=Monaco:h16            " Use Monaco font on OSX.
        set lines=52                      " Window size.
        set columns=165
        set vb                            " Disable the audible bell.
        macmenu &File.New\ Tab key=<nop>
        map <D-t> :CommandT<CR>
    endif
else
    " colorscheme railscasts
    set guifont=Monaco:h13            " Use a good font.
    set selection=exclusive           " Do not select the end of line. 
endif

if has('mouse')
    set mouse=a                   " Enable mouse everywhere.
    set mousemodel=popup_setpos   " Show a pop-up for right-click.
    set mousehide                 " Hide mouse while typing.
endif


" ------------------------------------------------------------------------------
" Auto Commands
" ------------------------------------------------------------------------------
if has("autocmd")
    " Jump to the last known position when reopening a file.
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     exe "normal! g'\"" |
        \ endif

    " Enable soft-wrapping for text files.
    au FileType text,markdown,html,xhtml,eruby setlocal wrap linebreak nolist

    " Reduce tab length for certain files types.
    au FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
    au FileType sass setlocal expandtab shiftwidth=2 tabstop=2
    filetype plugin indent on
    
    augroup filetypedetect
        au BufNewFile,BufRead bash-fc-* setf sh
        au BufNewFile,BufRead zshecl* setf zsh
        au BufNewFile,BufRead *.applescript setf applescript
        au BufNewFile,BufRead *.scpt setf applescript
        au BufNewFile,BufRead *.txt setf text
        au BufNewFile,BufRead *.exs setf elixir
        au BufNewFile,BufRead *.mustache set ft=html syntax=mustache
        au BufNewFile,BufRead *.zsh-theme set ft=zsh
        au BufNewFile,BufRead *.jquery*.js set ft=javascript syntax=jquery
        au BufNewFile,BufRead *_spec.rb syn keyword rubyRspec describe context it specify it_should_behave_like before after setup subject its shared_examples_for shared_context let
        au! BufRead,BufNewFile *.json set filetype=json 
    augroup END
endif

augroup json_autocmd 
    autocmd! 
    autocmd FileType json set autoindent 
    autocmd FileType json set formatoptions=tcq2l 
    autocmd FileType json set textwidth=78 shiftwidth=2 
    autocmd FileType json set softtabstop=2 tabstop=8 
    autocmd FileType json set expandtab 
    autocmd FileType json set foldmethod=syntax 
augroup END 

hi def link rubyRspec Function

colorscheme molokai


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle')

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/vundle'

" My bundles here:
"
Plugin 'kien/ctrlp.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rake.git'
Plugin 'tpope/vim-rails.git'
Plugin 'elixir-lang/vim-elixir'
Plugin 'mattonrails/vim-mix'
Plugin 'kchmck/vim-coffee-script'
Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
syntax on                    " Enable syntax highlighting.
filetype off                 " Detect file type.
filetype indent on           " Enable file indenting.
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

