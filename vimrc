""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Plug
""""""""""""""""""""""""""""""""""""""""""""""""""

"Automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Necessary to do cool stuff
set nocompatible

"Pluggins will be downloaded under the specified directory
call plug#begin('~/.vim/plugins')

""""""""""""""""""""""""""""""""""""""""""""""""""

" Language hilighting packages
Plug 'sheerun/vim-polyglot'

" Shows indent guides
Plug 'nathanaelkane/vim-indent-guides'

" Colorscheme management
Plug 'lifepillar/vim-colortemplate'

" Templates
Plug 'tibabit/vim-templates'

" All Plugins must be added before the following line
call plug#end()

" Brief help
" :PlugInstall		- installs plugins; append `!` to update or just :PluginUpdate
" :PlugUpdate		- updates plugins
" :PlugUpgrade		- upgrades vim-plug
" :PlugClean		- confirms removal of unused plugins; append `!` to auto-approve removal
"

" Indent Guides
let g:indent_guides_enable_on_vim_startup=1

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

" To recognize groff filetype
au BufNewFile,BufRead *.mom set filetype=groff

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
set guifont=FuraCode\ Nerd\ Font\ Mono\ 12

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
" Do not use spaces instead of tabs
set noexpandtab

" But be smart with tabs
set smarttab

" 1 tab = 4 spaces
set tabstop=4
set shiftwidth=4 "for indent operations

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
" Source files
noremap <leader>s :source ~/.vim/vimrc <CR>

" Circle through buffers
noremap <leader>n :bn<CR>
noremap <leader>b :bp<CR>

" Clear the search highlight
noremap <leader>h :nohl<CR>

" Make use of xclipboard
nnoremap <leader>v "+p
vnoremap <leader>c "+y

" Compile document
noremap <leader><Enter> :w! \| !compiler %<CR>

" Compile mom folder into pdf
noremap <leader>m :w! \| !mommerge<CR>

" Plugin management
noremap <leader>pi :PlugInstall<CR>
noremap <leader>pc :PlugClean<CR>
noremap <leader>pu :PlugUpdate \| PlugUpgrade<CR>

" Colorize
noremap <leader>cc :ColorizerToggle<CR>

" Template
noremap <leader>ti :TemplateInit<CR>
noremap <leader>te :TemplateExpand<CR>
