set nocompatible              " be iMproved, required
filetype plugin on
										
call plug#begin('~/.vim/plugged')

" The Basics 
    Plug 'suan/vim-instant-markdown', {'for': 'markdown'} " Markdown Preview
    Plug 'frazrepo/vim-rainbow'
    Plug 'airblade/vim-gitgutter'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'itchyny/lightline.vim'                       " Lightline statusbar
" File management 
    Plug 'preservim/nerdtree'                         " Nerdtree
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'     " Highlighting Nerdtree
    Plug 'ryanoasis/vim-devicons'                      " Icons for Nerdtree
" Productivity 
    Plug 'vimwiki/vimwiki'                             " VimWiki 
    Plug 'jreybert/vimagit'                            " Magit-like plugin for vim
" Tim Pope Plugins 
    Plug 'tpope/vim-surround'                          " Change surrounding marks
" Syntax Highlighting and Colors
    Plug 'PotatoesMaster/i3-vim-syntax'                " i3 config highlighting
    Plug 'kovetskiy/sxhkd-vim'                         " sxhkd highlighting
    Plug 'ap/vim-css-color'                            " Color previews for CSS
" Intellisense  
    Plug 'zxqfl/tabnine-vim'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

"  General Settings
set path+=**					" Searches current directory recursively.
set wildmenu					" Display all matches when tab complete.
set incsearch                   " Incremental search
set hidden                      " Needed to keep multiple buffers open
set nobackup                    " No auto backups
set noswapfile                  " No swap
set autochdir
set tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab
set renderoptions=type:directx
set clipboard=unnamedplus       " Copy/paste between vim and other programs.
set number relativenumber

" Color Settings 
packadd! omni
colorscheme omni
syntax enable
set bg=dark cursorline termguicolors

" Theme lightline
let g:lightline = {
      \ 'colorscheme': 'omni',
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
map <C-v> :vsplit<CR>

nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
nmap <C-p> :Files<CR>


" Open NERDTree when no file is to be opened at sratup 
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
