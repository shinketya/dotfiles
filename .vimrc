" ========================================
" プラグイン
" ========================================

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/shinketya/.cache/dein//repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/shinketya/.cache/dein/')
  call dein#begin('/home/shinketya/.cache/dein/')

  " Let dein manage dein
  " Required:
  call dein#add('/home/shinketya/.cache/dein//repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('tomtom/tcomment_vim')
  "カラースキーム
  call dein#add('tomasr/molokai')
  call dein#add('w0ng/vim-hybrid')
  "ステータスラインの表示強化
  call dein#add('itchyny/lightline.vim')
  "css
  call dein#add('hail2u/vim-css3-syntax')
  "html
  "javascript indent
  call dein#add("vim-scripts/javascript-indent")
  "go
  call dein#add("fatih/vim-go")
  "swift
  call dein#add('keith/swift.vim')

  " nerdtree
  call dein#add('scrooloose/nerdtree')
  " インデント可視化
  call dein#add('nathanaelkane/vim-indent-guides')

  " VimShell

  call dein#add('Shougo/vimshell.vim')
  call dein#add('Shougo/vimproc.vim', {'build': 'make'})




  " You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim', { 'rev': '01203d4c9' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------
" ========================================
" カラースキームの設定
set t_Co=256
syntax on
colorscheme molokai
highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
" ========================================
" setting
" 文字コードをUTF-8に設定
set fenc=utf-8
" 保存時の文字コード
set fileencoding=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示
set showcmd
" ========================================
" 見た目系
" タイトル表示
set title
" 行番号表示
set number
" 現在の行を強調表示
set cursorline
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" コマンドラインの補完
set wildmode=list:longest
" カラムラインを引く
set colorcolumn=80
" ========================================
" ステータスラインの設定
" ========================================
" ステータスラインを常に表示
set laststatus=2
" 現在のモードを表示
set showmode
" 打ったコマンドをステータスラインの下に表示
set showcmd
" ステータスラインの右側にカーソルの現在位置を表示
set ruler

" ========================================
" Tab/indent系
set expandtab
" タブ文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2
" 開業時に前のインデントを継続する
set autoindent
" 開業時に入力された行の末尾に合わせて次の行のインデントを増減
set smartindent
" ========================================
" 機能系
" ========================================
" インサートモードに入るときコメントアウトされないように
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set showmatch
set matchtime=1


" エイリアス
:command Tr NERDTree
