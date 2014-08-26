set nocompatible              
filetype off                  " required

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

"a tree explorer plugin
Plugin 'scrooloose/nerdtree'
Plugin 'minibufexpl.vim'
Plugin 'winmanager'
Plugin 'mattn/emmet-vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'spf13/vim-autoclose'
"using tagbar instead of taglist
Plugin 'majutsushi/tagbar'
"Plugin 'taglist.vim'
Plugin 'tomtom/tcomment_vim'

Plugin  'Valloric/YouCompleteMe'
"Plugin 'ctags.vim'
Plugin 'L9'
"YCM contains SuperTab's features
"Plugin 'SuperTab'
Plugin 'a.vim'
Plugin 'bling/vim-airline'

Plugin 'vimwiki'
"The only advantage over ctrlp is performance.BUt I just install ctrlp a
"few days. so I will install it later
"Plugin Yggdroot/LeaderF
Plugin 'kien/ctrlp.vim'

filetype plugin indent on     " required

syntax enable
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

set guifont=DejaVu\ Sans\ Mono\ 12
if (has("gui_running"))
    set nowrap
    set guioptions+=b
else
    set wrap
endif

set history=50

set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set ambiwidth=double

set mouse=a
set ruler
set number

set backspace=eol,start,indent
set whichwrap=b,s,<,>,[,]
set textwidth=78
set lbr
set fo+=mB

"制表符占4个空格
set tabstop=4
"默认缩进4个空格大小
set shiftwidth=4
"用空格替代制表符
set expandtab
set smarttab
set cindent
"从spf13中抄来的
set linespace=0                 " No extra spaces between rows
set foldenable                  " Auto fold code
set statusline+=\ [%{&ff}/%Y]            " Filetype
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h
"about airline
  let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tabline#enbabled = 1
set laststatus=2

function! AirlineInit()
    let g:airline_section_a = airline#section#create(['mode',' ','branch'])
    let g:airline_section_b = airline#section#create_left(['ffenc','hunks','%f'])
    let g:airline_section_c = airline#section#create(['filetype'])
    let g:airline_section_x = airline#section#create(['%P'])
    let g:airline_section_y = airline#section#create(['%B'])
    let g:airline_section_z = airline#section#create_right(['%l','%c'])
endfunction
autocmd VimEnter * call AirlineInit()

"about tagbar
nmap <Leader>tb :TagbarToggle<CR>
let g:tagbar_ctags_bin='/usr/bin/ctags'
let g:tagbar_width=30
let g:tagbar_left=1

"about winManager
let g:winManagerWindowLayout='FileExplorer|Tagbar'
nmap wm :WMToggle<CR>


set ignorecase
set smartcase
set incsearch
set foldmethod=indent

"show matching bracket
set showmatch
set showcmd

set hlsearch
set nobackup

"customed map by myself
noremap j gj
noremap k gk
map <F2> ggO/*<CR><ESC>:r !date<CR>kJo<BS>/<CR><ESC>
imap <M-a> <ESC>la
command Ee edit ~/.vimrc
