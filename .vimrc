set nocompatible

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Raimondi/delimitMate'
Plugin 'majutsushi/tagbar'
Plugin 'Valloric/YouCompleteMe'
Plugin 'L9'
Plugin 'a.vim'
Plugin 'vimwiki'
Plugin 'kien/ctrlp.vim'
Plugin 'Indent-Guides'
Plugin 'tomtom/tcomment_vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'suan/vim-instant-markdown'

call vundle#end()

" basic settings {
    filetype plugin indent on
    syntax on
    set encoding=utf-8
    "定义<Leader>
    let mapleader = ","
    set backspace=eol,start,indent
    set whichwrap=b,s,<,>,[,]
    set history=100
    set ignorecase
    "自动识别大小写敏感,有一个大写就是敏感,要打开ignorecase
    set smartcase
    set incsearch
    set showmatch "show matching bracket
    set showcmd   "显示未完成的命令
    " 命令行补全时显示候选菜单
    set wildmenu
    set cindent
    " 列之间无间隔
    set linespace=0
    "允许在修改了的缓冲区之间切换
    set hidden
    "便于显示manual page,<Leader>K新建一个窗口显示
    runtime ftplugin/man.vim
    "airline 会显示模式，所以禁用vim的
    set noshowmode
    set nobackup
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 12
    set textwidth=80
    autocmd Filetype gitcommit setlocal spell
" }

" display {
    " 开启vim时不显示介绍信息
    set shortmess=atI
    set t_Co=16 "为了终端支持solarized
    colorscheme solarized
    set background=dark
    set laststatus=2   " 总是显示状态栏
    " set ruler          " 显示光标当前位置
    set number         " 开启行号显示
    set cursorline     " 高亮当前行
    set cursorcolumn   " 高亮当前列
    set mouse=a        " 支持使用鼠标
    set mousehide      " 键盘输入时隐藏鼠标
    set nowrap         " 禁止折行
    "显示tab(>---)和尾部空格(---)
    set list listchars=tab:>-,trail:-
    "下面这个命令好像可以使vim的color不会覆盖终端的设置
    "便于终端透明
    hi Normal ctermbg=none
" }

" tabs {
    " 使用:ret可以用自己定义的制表符规则进行处理
    set tabstop=4    "制表符占4个空格
    set shiftwidth=4 "默认缩进4个空格大小
    set softtabstop=4
    set expandtab    "用空格替代制表符
    set smarttab
" }

" fold {
    set nofoldenable       "启动 vim 时关闭折叠代码
    set foldmethod=syntax  "语法折叠
    set foldlevel=1        "折叠层数
" }

"将*.md文件视为markdown格式
autocmd BufNewFile,BufRead *.md set filetype=markdown

" basic mappings {
    " 注意：从左边后面的第一个非空白字符开始到行尾(或'|')都属于映射的内容
    " noremap 为正常模式下的映射
    " nnoremap为正常模式下的非递归、非嵌套映射
    " wrap选项开启后会自动折行，j,k无法移动到屏幕上被折的行，因此将j,k映射
    " 为gj,gk
    nnoremap j gj
    nnoremap k gk
    " 空格向前翻页
    nnoremap <space> <C-F>
    " 回车向后翻页
    nnoremap <CR> <C-B>
    " 切换窗口
    nnoremap <C-J> <C-W>j
    nnoremap <C-K> <C-W>k
    nnoremap <C-L> <C-W>l
    nnoremap <C-H> <C-W>h
    "<C-P>,<C-N>不过滤命令
    cnoremap <C-P> <Up>
    cnoremap <C-N> <Down>
    " 将系统剪贴板内容粘贴至vim
    nnoremap <Leader>p "+p
    " 将选中的文本复制至系统剪贴板
    vnoremap <Leader>y "+y
    nnoremap <Leader>; :edit ~/.vimrc<CR>
    noremap <Leader>k <Leader>K
" }

" airline {
    let g:airline_theme = 'dark'
    let g:airline_powerline_fonts=1
    " 自动显示缓冲区
    let g:airline#extensions#bufferline#enabled = 1
    let g:airline#extensions#tabline#show_buffers = 1
    let g:airline#extensions#tabline#buffer_idx_mode = 1
    nmap <silent> <leader>1 <Plug>AirlineSelectTab1
    nmap <silent> <leader>2 <Plug>AirlineSelectTab2
    nmap <silent> <leader>3 <Plug>AirlineSelectTab3
    nmap <silent> <leader>4 <Plug>AirlineSelectTab4
    nmap <silent> <leader>5 <Plug>AirlineSelectTab5
    nmap <silent> <leader>6 <Plug>AirlineSelectTab6
    nmap <silent> <leader>7 <Plug>AirlineSelectTab7
    nmap <silent> <leader>8 <Plug>AirlineSelectTab8
    nmap <silent> <leader>9 <Plug>AirlineSelectTab9
    "enable syntastic integration
    let g:airline#extensions#syntastic#enabled = 1
    let g:airline#extensions#tabline#enabled = 1
    "避免 vim-bufferline 同时在状态栏和命令栏显示
    let g:bufferline_echo = 0
" }

" delimitMate {
    let delimitMate_expand_cr = 1
    let delimitMate_expand_space = 1
" }

" tagbar {
    nmap <Leader>tb :TagbarToggle<CR>
    let g:tagbar_ctags_bin='/usr/bin/ctags'
    let g:tagbar_width=30
    let g:tagbar_left=1
" }


" indent_guides {
    " 随 vim 自启动
    let g:indent_guides_enable_on_vim_startup=1
    " 从第二层开始可视化显示缩进
    let g:indent_guides_start_level=2
    let g:indent_guides_guide_size=1
    nmap <silent> <Leader>i <Plug>IndentGuidesToggle
" }

" YouCompleteMe {
    " 在有错的那一行按<Leader>d可以显示显示完整的错误提示
    " 开启注释中的补全功能
    let g:ycm_complete_in_comments = 1
    " 收集注释和字符串中的identifier(标识符)用于补全
    let g:ycm_collect_identifiers_from_comments_and_strings = 1
    " 补全语法关键字
    let g:ycm_seed_identifiers_with_syntax = 1
    " 指定ycm_extra_conf.py文件
    let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
    " detect filetype
    let g:ycm_extra_conf_vim_data = ['&filetype']
    "该目录下的.ycm_extra_conf.py文件会加载
    let g:ycm_extra_conf_globlist = ['~/.vim/bundle/*']
" }

" vim-instant-markdown {
    " 自动显示预览窗口
    let g:instant_markdown_autostart = 1
" }
