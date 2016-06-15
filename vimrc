" My .vimrc
"
" Maintainer: Damien Cirotteau d@cirotteau.info
" Last modified:	13/09/12 23:16:09
"

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible


" source $HOME/.vim/settings/plugins.vim
source $HOME/.vim/settings/plug.vim


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
let g:indent_guides_start_level=4

set autoread
au CursorHold * checktime


" command line completion
set wildmenu 
set wildmode=longest,list 

"""""""""""""""""""""""
"" LAYOUT AND COLORS  "
"""""""""""""""""""""""

"" color
colorscheme solarized

set background=dark

"" GUI with no GUI ;)
"" no toolbar or menu
set guioptions-=T
set guioptions-=m
" No scrollbars please
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=b

"fonts
set guifont=Inconsolata\ for\ Powerline\ 11
let g:airline_powerline_fonts = 1

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


""""""""""""""""""
" MOVING AROUND  "
""""""""""""""""""
" use the arrow to cycle the buffer
map <right> :bn<CR>
map <left> :bp<CR>
"" and disable the up and down key so that I am forced to use vim correctly
map <up> " "
map <down> " "



"""""""""""""""""""
" UNDO
"""""""""""""""""""
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

"""""""""""""""""""""
" CUSTOM COMMANDS   "
"""""""""""""""""""""

" Map leader
let mapleader = ","
let maplocalleader = "&"

" Kill buffer without killing the window
map <leader>k :BD<CR>


"   Edit another file in the same directory as the current file
"   uses expression to extract path from current file's path
"  (thanks Douglas Potts)
if has("unix")
	map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
else
	map <Leader>e :e <C-R>=expand("%:p:h") . "\" <CR>
endif


let g:netrw_home=$XDG_CACHE_HOME.'/vim'


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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Do not use python-mode folding
let g:pymode_folding = 0

" Do not use python-mode indent
" let g:pymode_indent = 0

" do not open window
let g:pymode_lint_cwindow = 0

let g:pymode_lint_checkers = ['pylint', 'pyflakes', 'pep8', 'mccabe']

let g:pymode_lint_ignore = "E501,W0403,W0232,E1101,E1102,F0401,C0111"

nmap <F7> :PymodeLint<CR>

let g:pymode_rope = 0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Django snippets
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType python set ft=python.django " For SnipMate
autocmd FileType html set ft=htmldjango.html " For SnipMate


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>

nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)


" ctrlp

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v([\/]\.(git|hg|svn|)|node_modules)$',
  \ 'file': '\v\.(pyc)$',
  \ }

" Vim-force
let g:apex_backup_folder="/tmp/apex/backup"
let g:apex_temp_folder="/tmp/apex/gvim-deployment"
let g:apex_properties_folder="/home/cirotteau/.sf"
let g:apex_tooling_force_dot_com_path = '/usr/local/bin/tooling-force.com.jar'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-force snippets
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd FileType apexcode set ft=python.django " For SnipMate


" UltiSnips
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
inoremap <c-x><c-k> <c-x><c-k>
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" " If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

source $HOME/.vim/settings/unite.vim
source $HOME/.vim/settings/neocomplete.vim
