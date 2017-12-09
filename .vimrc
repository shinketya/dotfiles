" ===============================================
" プラグイン
" ===============================================
if has('vim_starting')
  set nocompatible
  " neobundle をインストールしていない場合は自動インストールする
  if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    echo "install neobundle..."
    " vim からコマンド呼び出してneobundle.vim のクローンつくる
    :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle'))
let g:neobundle_default_git_protocol='https'

" neobundle#begin - neobundle#end の間に導入するプラグインを記載
NeoBundleFetch 'Shougo/neobundle.vim'
" ===============================================
" カラースキーム
NeoBundle 'tomasr/molokai'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'vim-scripts/rdark'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'vim-scripts/twilight'

" ===============================================
" ステータスラインの表示内容強化
NeoBundle 'itchyny/lightline.vim'
" インデントの可視化
NeoBundle 'Yggdroot/indentLine'
" ファイルをtree表示
NeoBundle 'scrooloose/nerdtree'
" URLブラウザで開く
NeoBundle 'open-browser.vim'
" j/kの移動高速化
NeoBundle 'deris/vim-gothrough-jk'
" vimrc に記述されたプラグインでインストールされていないものがないかチェックする
NeoBundleCheck
call neobundle#end()
filetype plugin indent on

" ===============================================
" カラースキーマの設定
set t_Co=256
syntax on
colorscheme molokai
set background=dark

" ===============================================
" setting
"文字コードをUFT-8に設定
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
" 入力中のコマンドをステータスに表示する
set showcmd

" ===============================================

" 見た目系
" タイトル表示
set title
" 行番号を表示
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

"=====================================
" ステータスラインの設定
"=====================================
" ステータスラインを常に表示
set laststatus=2
" 現在のモードを表示
set showmode
" 打ったコマンドをステータスラインの下に表示
set showcmd
" ステータスラインの右側にカーソルの現在位置を表示する
set ruler

" ===============================================

" Tab/indent系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2
" 改行時に前のインデントを継続する
set autoindent
" 改行時に入力された行の末尾に合わせて次の行をインデントを増減
set smartindent
" ===============================================
" 機能系
"  インサートモードに入るときに自動でコメントアウトされないようにする
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set showmatch
set matchtime=1
" open-broser.vim
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
