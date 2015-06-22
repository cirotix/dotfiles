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
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'gmarik/Vundle.vim'

" My Bundles here :
" repos from github
Bundle 'ddollar/nerdcommenter'
Bundle 'h1mesuke/unite-outline'
Bundle 'honza/vim-snippets'
Bundle 'hynek/vim-python-pep8-indent'
Bundle 'jeffkreeftmeijer/vim-numbertoggle'
Bundle 'jiangmiao/auto-pairs'
Bundle 'kien/ctrlp.vim'
Bundle 'klen/python-mode'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'majutsushi/tagbar'
" Bundle 'msanders/snipmate.vim'
Bundle 'neowit/vim-force.com'
Bundle 'othree/xml.vim'
Bundle 'robhudson/snipmate_for_django'
Bundle 'Shougo/neocomplcache.vim'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimproc.vim'
Bundle 'SirVer/ultisnips'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
" Bundle 'wincent/Command-T'

" Bundle 'jceb/vim-orgmode'
" Bundle 'scrooloose/syntastic'


" vim-scripts
"Bundle 'bufexplorer.zip'
Bundle 'bufkill.vim'
Bundle 'calendar.vim--Matsumoto'
Bundle 'bufexplorer.zip'
Bundle 'taglist.vim'

call vundle#end() 


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
set gfn=Inconsolata\ 10 

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
map <leader>k :bp<bar>sp<bar>bn<bar>bd<CR>

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
" Python configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Do not use python-mode folding
let g:pymode_folding = 0

" Do not use python-mode indent
let g:pymode_indent = 0

" do not open window
let g:pymode_lint_cwindow = 0

let g:pymode_lint_checkers = ['pylint', 'pyflakes', 'pep8', 'mccabe']

let g:pymode_lint_ignore = "E501,W0403,W0232,E1101,E1102,F0401,C0111"
"
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

" neocomplcache
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" " Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" " Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Unite
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])

nnoremap <silent> <leader>g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> <leader>G :<C-u>UniteWithCursorWord grep:. -buffer-name=search-buffer<CR>
nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>u :<C-u>Unite -buffer-name=buffer  buffer<cr>

if executable('pt')
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor'
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_grep_encoding = 'utf-8'
endif


" Vim-force
let g:apex_backup_folder="/tmp/apex/backup"
let g:apex_temp_folder="/tmp/apex/gvim-deployment"
let g:apex_properties_folder="/home/cirotteau/.sf"
let g:apex_tooling_force_dot_com_path = '/usr/local/bin/tooling-force.com.jar'


" UltiSnips
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" " If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
