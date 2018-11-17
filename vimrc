execute pathogen#infect()
set nocompatible

"Syntax highlighting based on filetype
syntax on
filetype plugin indent on

set background=dark
colorscheme solarized          "Color Scheme from plugin
set number                  "Line number
set colorcolumn=90          "Line up column
set hidden                  "Hides buffers
set history=100             "Vim command history
set undolevels=1000         "UNDOOOOOO

set hlsearch                "Highlight search
set incsearch               "Show search matches while I type
set ignorecase              "Ignore cases when searching
set smartcase               "Ignore case if search pattern is all lowercase

set nowrap                  "Do not wrap lines
set tabstop=4
set shiftwidth=4
set shiftround
set expandtab
set smartindent
set autoindent
set showmatch

set wildignore=*.swp,*.bak,*.pyc,*.class  "Ignore these filetypes
set title
set visualbell
set noerrorbells

"Paste mode to better paste large amounts of stuff
set pastetoggle=<F2>

"Leader Key
let mapleader=" "

"Mapping
nmap <silent><leader>s :source ~/.vimrc<CR>
nmap <silent><leader>h :help

"Remove all white space on save
if has('autocmd')
    autocmd BufWritePre * :%s/\s\+$//e
endif

"Cancel search
"nnoremap <silent><Esc> :nohlsearch<Bar>:echo<CR>

nnoremap <Leader><Leader> :e#<CR>

" NerdTree
autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
