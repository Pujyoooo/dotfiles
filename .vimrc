if has('vim_starting')
set nocompatible               " Be iMproved
 set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'scrooloose/nerdtree'
"NeoSnippets
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
" Added For Ruby Programming
NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'tpope/vim-endwise'

" Add color scheme
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
" Add HTML5/CSS3/JS tag color
NeoBundle 'othree/html5.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'jelera/vim-javascript-syntax'

call neobundle#end()
NeoBundleCheck
filetype plugin indent on " Required!
"--------------------------------
" 基本設定
" --------------------------------
" vim内部で使われる文字エンコード
set encoding=utf-8

syntax on
"折り返し無効
set nowrap
"検索オプション
set hlsearch
set ignorecase
set smartcase
"autoindent有効
set autoindent
"カーソル行の表示
set ruler
set number
"タブ文字をCTRL-lで表示、行末に$で表示
set list
"コマンド補完が拡張モード
set wildmenu
"コマンドを画面の最下行に表示
set showcmd

"タブのインデント数
set shiftwidth=2
set softtabstop=2
set expandtab
set tabstop=2
"shiftwidthの数だけインデント
set smarttab

set clipboard=unnamed
"backspace 有効
set backspace=start,eol,indent
"------------------------------
"lightline configuration
"------------------------------
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif
let g:lightline = {
    \ 'colorscheme': 'wombat'
    \}

"------------------------------
"vim-indent-guides conigration
"-----------------------------
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1

"-----------------------------
"NerdTree configration
"-----------------------------
nnoremap <silent><C-e> :NERDTreeToggle<CR>
