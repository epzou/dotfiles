set nocompatible
filetype off
  
if has('vim_starting')
  set runtimepath+=$HOME/.bundle/neobundle.vim

  call neobundle#rc(expand('$HOME/.bundle'))
endif

" Plugin Control
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'

" Edit
NeoBundle 'git://github.com/vim-scripts/AutoClose.git'
NeoBundle 'git://github.com/tpope/vim-surround.git'
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
NeoBundle 'git://github.com/mattn/emmet-vim.git'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'git://github.com/editorconfig/editorconfig-vim.git'

" Programming
NeoBundle 'git://github.com/tpope/vim-rails.git'
NeoBundle 'git://github.com/jelera/vim-javascript-syntax.git'
NeoBundle 'git://github.com/kchmck/vim-coffee-script.git'
NeoBundle 'git://github.com/scrooloose/syntastic.git'
NeoBundle 't9md/vim-textmanip'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'briancollins/vim-jst'

" Git
NeoBundle 'git://github.com/tpope/vim-fugitive.git'

" Unite
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/sgur/unite-qf.git'

" ColorScheme
NeoBundle 'git://github.com/jpo/vim-railscasts-theme.git'

" Utility
NeoBundle 'git://github.com/Shougo/vimfiler.git'
NeoBundle 'git://github.com/Lokaltog/vim-powerline.git'
NeoBundle 'git://github.com/rhysd/clever-f.vim.git'
NeoBundle 'git://github.com/fuenor/qfixgrep.git'
NeoBundle 'git://github.com/thinca/vim-quickrun.git'
NeoBundle 'git://github.com/thinca/vim-qfreplace.git'
NeoBundle 'git://github.com/vim-scripts/sudo.vim.git'
NeoBundle 'git://github.com/Shougo/vimproc.git', {
            \ 'build' : {
            \   'mac' : 'make -f make_mac.mak',
            \   'unix' : 'make -f make_unix.mak',
            \   },
            \ }



filetype plugin on

if !has('gui_running')
  set t_Co=256
  syntax enable
  set background=dark
  colorscheme base16-railscasts 
endif

" 行番号を表示
set number
" カレントディレクトリを自動で変更
set autochdir
" バックアップファイルを作成しない
set nobackup
" スワップファイルを作成しない
set noswapfile
" 変更のあったファイルを自動で読み込み
set autoread

" クリップボードを共有する
set clipboard=unnamed,autoselect

" タブ入力を半角スペースに変換
set expandtab
" タブを表示するときの幅
set tabstop=2
" タブを挿入するときの幅
set shiftwidth=2

au FileType coffee set ts=2 sw=2 expandtab
au FileType slim set ts=2 sw=2 expandtab
au FileType python set ts=2 sw=2 expandtab
au FileType php set ts=4 sw=4 noexpandtab
au FileType html set ts=4 sw=4 expandtab

au FileType ruby set ts=2 sw=2 expandtab
au BufRead,BufNewFile *.thor set filetype=ruby
au BufRead,BufNewFile *.erb set ts=2 sw=2 expandtab

au FileType javascript set ts=2 sw=2 expandtab
au BufRead,BufNewFile *.ejs set filetype=jst
au BufRead,BufNewFile *.ejs set ts=2 sw=2 expandtab
au BufRead,BufNewFile *.ejs.* set filetype=jst
au BufRead,BufNewFile *.ejs.* set ts=2 sw=2 expandtab

" syntastic
let g:syntastic_mode_map = { 'mode': 'active',
  \ 'active_filetypes': ['ruby', 'javascript'],
  \ 'passive_filetypes': ['html'] }
let g:syntastic_auto_loc_list = 1
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_javascript_jshint_conf = '$HOME/.jshintrc'

" NeoComplCache
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" 補完ウィンドウの設定
set completeopt=menuone

" VimPowerLine
let g:Powerline_symbols='fancy'
" VimFiler
"let g:vimfiler_edit_action = 'tabopen'
let g:vimfiler_edit_action = 'tabdrop'

" Don't use preview at QuickFix
let QFix_PreviewEnable = 0

" Clever-f
let g:clever_f_fix_key_direction = 1
let g:clever_f_smart_case = 1

" CoffeeScriptの自動コンパイル
"autocmd BufWritePost *.coffee silent make! -cb | cwindow | redraw! " ## old way ##
"autocmd BufWritePost *.coffee silent make!

" キーマップ(矢印キー制限)
"inoremap <BS> <Nop>
inoremap <Right> <Nop>
"inoremap <Left> <Nop> " 追記：日本語入力時に誤動作する
inoremap <Up> <Nop>
inoremap <Down> <Nop>
nnoremap <Right> <Nop>
nnoremap <Left> <Nop>
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap 0 :<C-u>call append(expand('.'), '')<Cr>

" キーマップ設定(VimFiler)
nmap <silent> <C-e> :VimFiler<CR>

" キーマップ設定(Unite)
nnoremap <silent> ,ub :<C-u>Unite buffer<CR> " Buffer list
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file " File list
nnoremap <silent> ,uc :<C-u>Unite colorscheme -auto-preview<CR>
nnoremap <silent> ,uq :<C-u>Unite qf<CR>

" キーマップ設定(vim-over)
nnoremap <silent> ,m :OverCommandLine<CR>%s/

" キーマップ(open .vimrc)
nnoremap <silent> ,vimrc :tabe ~/.vimrc<CR>
nnoremap <silent> ,gvimrc :tabe ~/.gvimrc<CR>
nnoremap <silent> ,so :source ~/.vimrc<CR>:source ~/.gvimrc<CR>

" キーマップ設定(Unite)
noremap <C-U><C-B> :Unite buffer<CR> " バッファ一覧
noremap <C-U><C-F> :UniteWithBufferDir -buffer-name=files file<CR> " ファイル一覧

" キーマップ(textmanip)
vmap <C-j> <Plug>(textmanip-move-down)
vmap <C-k> <Plug>(textmanip-move-up)
vmap <C-h> <Plug>(textmanip-move-left)
vmap <C-l> <Plug>(textmanip-move-right)
" 行の複製
nmap <D-d> <Plug>(textmanip-duplicate-down)
vmap <D-d> <Plug>(textmanip-duplicate-down)

"tabで補完候補の選択を行う
inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<Up>" : "\<S-TAB>"

