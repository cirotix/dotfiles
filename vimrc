" My .vimrc
"
" Maintainer: Damien Cirotteau d@cirotteau.info
" Last modified:	13/09/12 23:16:09
"

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

""""""""""""""""""""""""
"  PLUGINS MANAGEMENT  "
""""""""""""""""""""""""
" Use vundle to manage the plugins
filetype off
set rtp+=~/.vim/bundle/vundle/

" Call pathogen
call vundle#rc()
Bundle 'gmarik/vundle'


" My Bundles here :
" repos from github
Bundle 'othree/xml.vim'
Bundle 'wincent/Command-T'
Bundle 'kien/ctrlp.vim'
Bundle 'ddollar/nerdcommenter'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-unimpaired'
Bundle 'Lokaltog/vim-powerline'
Bundle 'msanders/snipmate.vim'
Bundle 'robhudson/snipmate_for_django'
Bundle 'jceb/vim-orgmode'
Bundle 'scrooloose/syntastic'
" Bundle 'chriskempson/tomorrow-theme/vim'

" vim-scripts
"Bundle 'bufexplorer.zip'
Bundle 'bufkill.vim'
Bundle 'calendar.vim--Matsumoto'
Bundle 'bufexplorer.zip'
Bundle 'taglist.vim'


""""""""""""""""""""""""""""""
"   GENERAL CONFIGURATION    "
""""""""""""""""""""""""""""""
 
" no errobells!!
set noerrorbells
set t_vb=
set visualbell

" status line
set laststatus=2 " Always show the statusline
set t_Co=256

" bakcup strategy
set nobackup       "no backup files
set noswapfile     "no swap file

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set history=100		" keep 100 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands

" search options
set incsearch		" do incremental searching
set nohlsearch		" don't highlight search
set ignorecase		"ignore the the search case
set smartcase		" only if the pattern is all downcase

" indentation
set shiftwidth=4
set tabstop=4
set expandtab

" command line completion
set wildmenu 
set wildmode=longest,list 

"""""""""""""""""""""""
"" LAYOUT AND COLORS  "
"""""""""""""""""""""""

set background=dark
"" color
colorscheme desert

"" GUI with no GUI ;)
"" no toolbar
set guioptions-=T
set guioptions-=m
:let g:toggleMenu = 0
map <silent> <S-F2> :if g:toggleMenu == 1<CR>:set guioptions-=m<CR>:let g:toggleMenu = 0<CR>:else<CR>:set guioptions+=m<CR>:let g:toggleMenu = 1<CR>:endif<CR> 

"fonts
set gfn=Inconsolata\ 9

" nicely format the comments
set formatoptions=roc


" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  "set hlsearch
endif

"" highlight the current line
set cursorline
hi cursorline guibg=#333333
hi CursorColumn guibg=#333333




""""""""""""""""""
" MOVING AROUND  "
""""""""""""""""""

" use the arrow to cycle the buffer
map <right> :bn<CR>
map <left> :bp<CR>
"" and disable the up and down key so that I am forced to use vim correctly
map <up> " "
map <down> " "


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Parenthesis/bracket expanding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap $$1 <esc>`>a)<esc>`<i(<esc>
")
vnoremap $$2 <esc>`>a]<esc>`<i[<esc>
vnoremap $$3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$$ <esc>`>a"<esc>`<i"<esc>
vnoremap $$q <esc>`>a'<esc>`<i'<esc>
vnoremap $$w <esc>`>a"<esc>`<i"<esc>

"Map auto complete of (, ", ', [
inoremap $$1 ()<esc>:let leavechar=")"<cr>i
inoremap $$2 []<esc>:let leavechar="]"<cr>i
inoremap $$4 {<esc>o}<esc>:let leavechar="}"<cr>O
inoremap $$3 {}<esc>:let leavechar="}"<cr>i
inoremap $$q ''<esc>:let leavechar="'"<cr>i
inoremap $$w ""<esc>:let leavechar='"'<cr>i
au BufNewFile,BufRead *.\(vim\)\@! inoremap " ""<esc>:let leavechar='"'<cr>i
au BufNewFile,BufRead *.\(txt\)\@! inoremap ' ''<esc>:let leavechar="'"<cr>i

imap <m-l> <esc>:exec "normal f" . leavechar<cr>a
imap <d-l> <esc>:exec "normal f" . leavechar<cr>a


"""""""""""""""""""""
" CUSTOM COMMANDS   "
"""""""""""""""""""""

" Map leader
let mapleader = ","
let maplocalleader = "&"

" CommandT
map <leader>t :CommandT<cr>
map <leader>b :CommandTBuffer<cr>
map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
map <leader>F :CommandTFlush<cr>\|:CommandT %%<cr>

"   Edit another file in the same directory as the current file
"   uses expression to extract path from current file's path
"  (thanks Douglas Potts)
if has("unix")
	map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
else
	map <Leader>e :e <C-R>=expand("%:p:h") . "\" <CR>
endif

" Could use snipmate
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>



""""""""""""""""
"" FILETYPES   "
""""""""""""""""

" Enable file type detection.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" Only do this part when compiled with support for autocommands.
if has("autocmd")


  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=72

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" | endif

  augroup END

else
  set autoindent		" always set autoindenting on
endif " has("autocmd")

" Drupal *.module
if has("autocmd")
  " Drupal *.module files.
  augroup module
    autocmd BufRead                     *.module set filetype=php
    autocmd BufRead                     *.install set filetype=php
    autocmd BufRead                     *.inc set filetype=php
    autocmd BufRead                     *.profile set filetype=php
  augroup END
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Django snippets
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType python set ft=python.django " For SnipMate
autocmd FileType html set ft=htmldjango.html " For SnipMate
