" start conf "

set number
set numberwidth=1
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set cursorline

set clipboard=unnamedplus " debemos tener instalado xclip

set mouse=a
set guicursor=

" vim-plug "

call plug#begin('~/.config/nvim/plugged')

" themes "
Plug 'morhetz/gruvbox'
Plug 'bluz71/vim-moonfly-colors'

" "
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'

" syntax "
Plug 'vim-python/python-syntax'
call plug#end()

" end vim-plug "

" syntax "
syntax on
syntax enable

let g:python_highlight_all = 1

" color scheme "
colorscheme moonfly "gruvbox
set background=dark 
let g:airline_theme = 'moonfly' 

let g:gruvbox_contrast_dark = "hard"

set noshowmode
" end color scheme "

let NERDTreeQuitOnOpen=1

set termguicolors

luafile $HOME/.config/nvim/lua/plug-colorizer.lua

au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

let mapleader=" "

" shortcuts "
nmap <Leader>nt :NERDTreeFind<CR>
nmap <Leader>w :wq<CR>
nmap <Leader>h :nohlsearch<CR>

" end conf "
