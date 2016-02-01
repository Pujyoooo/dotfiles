if has('vim_starting')
set nocompatible               " Be iMproved
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/unite.vim'
"NeoSnippets
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
" Added For Ruby Programming
NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'tpope/vim-endwise'
call neobundle#end()

filetype plugin indent on " Required!
NeoBundleCheck

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

