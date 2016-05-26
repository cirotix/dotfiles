" ----------------------------------------------------------------------------

" Install vim-plug if we don't already have it
if empty(glob("~/.vim/autoload/plug.vim"))
    " Ensure all needed directories exist  (Thanks @kapadiamush)
    execute 'mkdir -p ~/.vim/plugged'
    execute 'mkdir -p ~/.vim/autoload'
    " Download the actual plugin manager
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

" My Plugs here :
" repos from github

" moving in file
Plug 'Lokaltog/vim-easymotion'

" editing
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'

" moving around
Plug 'kien/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" unite
Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/neoyank.vim'
Plug 'Shougo/vimproc.vim'
" Plug 'h1mesuke/unite-outline'
" Plug 'tsukkee/unite-tag'

" tags
Plug 'majutsushi/tagbar'

Plug 'jiangmiao/auto-pairs'
Plug 'Valloric/YouCompleteMe'

" snippets
Plug 'SirVer/ultisnips'
Plug 'robhudson/snipmate_for_django'
Plug 'honza/vim-snippets'

" git
Plug 'tpope/vim-fugitive'


" languages

Plug 'klen/python-mode'
Plug 'alfredodeza/pytest.vim'
Plug 'hynek/vim-python-pep8-indent'

Plug 'othree/xml.vim'

Plug 'neowit/vim-force.com'

" utils
Plug 'ddollar/nerdcommenter'
Plug 'qpkorr/vim-bufkill'

" gui
Plug 'bling/vim-airline'
Plug 'altercation/vim-colors-solarized'

" removed
" Plug 'tpope/vim-unimpaired'


" Plug 'mjbrownie/vim-htmldjango_omnicomplete'
" Plug 'Shougo/neocomplete.vim'
" Plug 'nathanaelkane/vim-indent-guides'


" Plug 'msanders/snipmate.vim'
" Plug 'scrooloose/syntastic'


filetype plugin indent on                   " required!
call plug#end()
