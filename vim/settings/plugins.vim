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
" Bundle 'h1mesuke/unite-outline'
Bundle 'honza/vim-snippets'
Bundle 'hynek/vim-python-pep8-indent'
Bundle 'jeffkreeftmeijer/vim-numbertoggle'
Bundle 'kien/ctrlp.vim'
Bundle 'klen/python-mode'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'majutsushi/tagbar'
Bundle 'neowit/vim-force.com'
Bundle 'othree/xml.vim'
Bundle 'robhudson/snipmate_for_django'
Bundle 'Shougo/neocomplcache.vim'
Bundle 'Shougo/neomru.vim'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimproc.vim'
Bundle 'SirVer/ultisnips'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'


" Bundle 'wincent/Command-T'
" Bundle 'jiangmiao/auto-pairs'
" Bundle 'msanders/snipmate.vim'

" Bundle 'jceb/vim-orgmode'
" Bundle 'scrooloose/syntastic'


" vim-scripts
"Bundle 'bufexplorer.zip'
Bundle 'bufkill.vim'
Bundle 'calendar.vim--Matsumoto'
Bundle 'bufexplorer.zip'
Bundle 'taglist.vim'

call vundle#end() 