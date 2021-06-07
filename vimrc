execute pathogen#infect()
set nocompatible

"Syntax highlighting based on filetype
syntax on
filetype plugin indent on

set path+=**
set wildmenu


set background=dark
"colorscheme solarized          "Color Scheme from plugin
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
set shiftround
set expandtab
set smartindent
set autoindent
set showmatch

" by default, the indent is 2 spaces
set shiftwidth=2
set softtabstop=2
set tabstop=2

" for python/js files, 4 spaces
autocmd Filetype javascript setlocal ts=4 sw=4 sts=0
autocmd Filetype python setlocal ts=4 sw=4 sts=0

" no expandtab for makefiles
autocmd Filetype make setlocal noexpandtab

command! MakeTags !ctags -R .

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
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
