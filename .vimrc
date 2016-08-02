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
" コード補完
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'marcus/rsense'
"NeoBundle 'supermomonga/neocomplete-rsense.vim'"

" 静的解析
NeoBundle 'scrooloose/syntastic'

" ドキュメント参照
NeoBundle 'thinca/vim-ref'
NeoBundle 'yuku-t/vim-ref-ri'

" メソッド定義元へのジャンプ
NeoBundle 'szw/vim-tags'

" 自動で閉じる
NeoBundle 'tpope/vim-endwise'

call neobundle#end()
NeoBundleCheck

" -------------------------------
" Rsense
" -------------------------------
let g:rsenseHome = '/usr/local/bin/rsense'
let g:rsenseUseOmniFunc = 1
" --------------------------------
" neocomplete.vim
" --------------------------------
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'

" --------------------------------
" rubocop
" --------------------------------
" syntastic_mode_mapをactiveにするとバッファ保存時にsyntasticが走る
" active_filetypesに、保存時にsyntasticを走らせるファイルタイプを指定する
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop', 'mri']

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
set noautoindent
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
"vim-indent-guides coniguration
"-----------------------------
colorscheme default
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
nnoremap <C-n> gt
nnoremap <C-p> gT

"-----------------------------
"Ctags configuration
"-----------------------------
nnoremap <C-]> g<C-]>
nnoremap <C-h> :vsp<CR> :exe("tjump " .expand('<cword>'))<CR>
nnoremap <C-h> :split<CR> :exe("tjump " .expand('<cword>'))<CR>

"-----------------------------
"vimgrep configuration
"-----------------------------
nnoremap [q :cprevious<CR>
nnoremap ]q :cnect<CR>
nnoremap [Q :<C-u>cfirst<CR>
nnoremap ]Q :<C-u>clast<CR>
"test
