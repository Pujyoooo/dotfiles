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

" -----------------------------
" プラグイン削除
" -----------------------------
call map(dein#check_clean(), "delete(v:val, 'rf')")
" vim再起動後以下のコマンドを実行するとプラグイン削除
" :call dein#recache_runtimepath()

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

" -----------------------------
" plantuml settings
" -----------------------------

let g:plantuml_executable_script = "~/dotfiles/plantuml"

" -----------------------------
" coc settings
" -----------------------------
" if hidden is not set, TextEdit might fail.
set hidden " 保存されていないファイルがあるときでも別のファイルを開くことが出来る

" Some servers have issues with backup files, see #649
set nobackup " ファイル保存時にバックアップファイルを作らない
set nowritebackup " ファイル編集中にスワップファイルを作らない

" Better display for messages
set cmdheight=2 " メッセージ表示行を二行確保

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300 " 自動保存を300msに変更

" don't give |ins-completion-menu| messages.
set shortmess+=c " ins-completion-menu 関連のメッセージを表示しない。

" always show signcolumns
" set signcolumn=yes " 目印行を表示する

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)
" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" For ALE Settings
let g:ale_statusline_format = ['E%d', 'W%d', 'OK']
let g:ale_linters = {
      \ 'html': [],
      \ 'css': ['stylelint'],
      \ 'javascript': ['prettier-eslint'],
      \ 'vue': ['eslint']
      \ }
let g:ale_linter_aliases = {'vue': 'css'}

nmap <silent> <C-w>j <Plug>(ale_next_wrap)
nmap <silent> <C-w>k <Plug>(ale_previous_wrap)

let g:ale_fixers = {
  \ 'javascript': ['prettier'],
  \ 'vue': ['prettier'],
  \ 'css': ['prettier']
\ }

" ファイル保存時に実行
let g:ale_fix_on_save = 1

" ローカルの設定ファイルを考慮する
let g:ale_javascript_prettier_use_local_config = 1
