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
set nowrap

set hlsearch
set ignorecase
set smartcase

set autoindent

set ruler
set number
set list
set wildmenu
set showcmd

set shiftwidth=4
set softtabstop=4

set expandtab
set tabstop=4
set smarttab

set clipboard=unnamed
"backspace 有効
set backspace=start,eol,indent

