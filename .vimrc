set nocompatible              " be iMproved, required
filetype plugin on

call plug#begin('~/.vim/plugged')

" The Basics 
    Plug 'itchyny/lightline.vim'                       " Lightline statusbar
    Plug 'suan/vim-instant-markdown', {'for': 'markdown'} " Markdown Preview
    Plug 'frazrepo/vim-rainbow'
    Plug 'airblade/vim-gitgutter'
" File management 
    Plug 'scrooloose/nerdtree'                         " Nerdtree
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'     " Highlighting Nerdtree
    Plug 'ryanoasis/vim-devicons'                      " Icons for Nerdtree
" Productivity 
    Plug 'vimwiki/vimwiki'                             " VimWiki 
    Plug 'jreybert/vimagit'                            " Magit-like plugin for vim
    Plug 'prettier/vim-prettier'
" Tim Pope Plugins 
    Plug 'tpope/vim-surround'                          " Change surrounding marks
" Syntax Highlighting and Colors
    Plug 'PotatoesMaster/i3-vim-syntax'                " i3 config highlighting
    Plug 'kovetskiy/sxhkd-vim'                         " sxhkd highlighting
    Plug 'ap/vim-css-color'                            " Color previews for CSS
" Theme 
    Plug 'morhetz/gruvbox'
" Junegunn Choi Plugins
    Plug 'junegunn/goyo.vim'                           " Distraction-free viewing
    Plug 'junegunn/limelight.vim'                      " Hyperfocus on a range
    Plug 'junegunn/vim-emoji'                          " Vim needs emojis!
" Intellisense  
    Plug 'zxqfl/tabnine-vim'

call plug#end()

"  General Settings
set path+=**					" Searches current directory recursively.
set wildmenu					" Display all matches when tab complete.
set incsearch                   " Incremental search
set hidden                      " Needed to keep multiple buffers open
set nobackup                    " No auto backups
set noswapfile                  " No swap
set clipboard=unnamedplus       " Copy/paste between vim and other programs.
set  number relativenumber
syntax enable


" Status Line
" The lightline.vim theme
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ }

" Always show statusline
set laststatus=2


" NERDTree
" Uncomment to autostart the NERDTree
" autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize=38

"  VimWiki
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

"  Vim-Instant-Markdown
let g:instant_markdown_autostart = 0         " Turns off auto preview
let g:instant_markdown_browser = "brave"      " Uses surf for preview

" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Key-bindings
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+2<CR>gv-gv

map q :quit<CR>
map <C-m> :Lex!<CR>
map <C-v> :vsplit<CR>

nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" Color Settings 
colorscheme gruvbox
set bg=dark cursorline termguicolors

" open NERDTree when no file is to be opened at sratup
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" }}}
