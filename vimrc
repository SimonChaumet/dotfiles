""""""""""""""""""""""""""""""""""""""""""""""""""
"						 "
"		Non-plugin stuff :		 "
"						 "
""""""""""""""""""""""""""""""""""""""""""""""""""
"-> General
""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines VIM has to remember
set history=500

" Set vim update time (milliseconds)
set updatetime=250

" Detect plugins filetypes
filetype plugin on

" Defining the <leader>
let mapleader = " "

" Remove the pause when leaving insert mode
set ttimeoutlen=10

" Autocomplete settings
set wildmode=longest,list,full

""""""""""""""""""""""""""""""""""""""""""""""""""
" -> VIM User Interface
""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets the font
set guifont=FiraCode\ Nerd\ Font\ Mono\ 12

" Set utf8 as standard encoding
set encoding=utf-8

" Shows the current position
set ruler

" Shows line numbers
set number

" Shows line numbers relative to the cursor
set relativenumber

" A buffer becomes hidden when abandonned
set hid

" Highlights search results
set hlsearch

" Searches before hitting ENTER
set incsearch

" Shows matching brackets when cursor is over them
set showmatch

" Shows the command that's being typed
set showcmd

" Splits to the right
set splitright

" Prevents nvim from being customized by text files commands
set nomodeline

"""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""
"Always show the status line
set laststatus=2

"Don't show editor mode
set noshowmode

" GUI colors
" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
syntax enable

" Colorscheme
set background=dark

""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Text, tab and indent
""""""""""""""""""""""""""""""""""""""""""""""""""
" But be smart with tabs
set smarttab

" 1 tab = 4 spaces
set tabstop=4
set shiftwidth=2 "for indent operations

" Indent and wrap rules
set si "smart indent
set wrap "wrap lines

" Stops the auto-commenting new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Enable autocompletion
set wildmode=longest,list,full

" Automatically removes all trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e

""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Macros
""""""""""""""""""""""""""""""""""""""""""""""""""
" Clear the search highlight
noremap <leader>h :nohl<CR>

" Make use of xclipboard
nnoremap <leader>v "+p
vnoremap <leader>c "+y
set clipboard+=unnamedplus

