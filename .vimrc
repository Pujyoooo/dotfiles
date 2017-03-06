" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = '~/dotfiles/rc/dein.toml'
  " let s:lazy_toml = g:rc_dir . '/dotfiles/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  " call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

" -----------------------------
" 基本設定
" -----------------------------
set encoding=utf-8
syntax on

" 折り返し無効
set nowrap

" コマンドを画面の最下行に表示
set showcmd

" オートインデント
set autoindent

" カーソル行の表示
set ruler
set number

" コマンド補完が拡張モード
set wildmenu

" タブのインデント数
set shiftwidth=2
set softtabstop=2
set expandtab
set tabstop=2

"shitwidthの数だけインデント
set smarttab

" インデントの見た目
set breakindent

" swapファイルを作成しない
set noswapfile

" クリップボード共通
set clipboard=unnamed,autoselect

" backspace 有効にする
set backspace=start,eol,indent

"ビープ音すべてを無効にする
set visualbell t_vb=
set noerrorbells "エラーメッセージの表示時にビープを鳴らさない


" ------------------------------
" lightline configuration
" ------------------------------
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif
let g:lightline = {
    \ 'colorscheme': 'wombat'
    \}

" ------------------------------
" vim-indent-guides coniguration
" -----------------------------
colorscheme default
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1

" -----------------------------
" NerdTree configration
" -----------------------------
nnoremap <silent><C-e> :NERDTreeToggle<CR>
nnoremap <C-n> gt
nnoremap <C-p> gT

" -----------------------------
" Ctags configuration
" -----------------------------
nnoremap <C-]> g<C-]>
nnoremap <C-h> :vsp<CR> :exe("tjump " .expand('<cword>'))<CR>
nnoremap <C-h> :split<CR> :exe("tjump " .expand('<cword>'))<CR>

" -----------------------------
" vimgrep configuration
" -----------------------------
nnoremap [q :cprevious<CR>
nnoremap ]q :cnect<CR>
nnoremap [Q :<C-u>cfirst<CR>
nnoremap ]Q :<C-u>clast<CR>

" -----------------------------
" remove trailing whitespace
" -----------------------------
autocmd BufWritePre * :%s/\s\+$//ge

let g:syntastic_mode_map = { 'mode': 'passive',
           \ 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']
