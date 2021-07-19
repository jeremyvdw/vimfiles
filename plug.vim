if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'hashivim/vim-terraform'

"Plug 'kien/ctrlp.vim'
"Plug 'plasticboy/vim-markdown'
"Plug 'rking/ag.vim'
"Plug 'scrooloose/nerdtree'
"Plug 'tpope/vim-projectionist'

" Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-rake.git'
" Plug 'tpope/vim-rails.git'
" Plug 'ngmy/vim-rubocop'
" Plug 'thoughtbot/vim-rspec'
" Plug 'elixir-lang/vim-elixir'
" Plug 'mattonrails/vim-mix'
" Plug 'pangloss/vim-javascript'
" Plug 'davidzchen/avro-vim'
" Plug 'Shougo/deoplete.nvim'

"Plug 'jgdavey/tslime.vim'
"Plug 'christoomey/vim-tmux-navigator'
"
"Plug 'neovim/nvim-lspconfig'
"
"" Clojure
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"Plug 'tpope/vim-salve', { 'for': 'clojure' }
Plug 'guns/vim-sexp', {'for': 'clojure'}
Plug 'tpope/vim-sexp-mappings-for-regular-people', {'for': 'clojure'}
"
"Plug 'luochen1990/rainbow', { 'for': 'clojure' }

Plug 'eraserhd/parinfer-rust', { 'for': 'clojure', 'do': 'cargo build --release' }

"let g:autofmt_autosave = 1


Plug 'christoomey/vim-tmux-navigator'

if has("nvim")
  Plug 'neovim/nvim-lspconfig'
endif


call plug#end()
