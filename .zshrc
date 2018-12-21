# goenv 設定
export GOENV_ROOT=$HOME/.goenv
export PATH=$GOENV_ROOT/bin:$PATH
eval "$(goenv init -)"
# GOPATH 設定
export GOPATH=$HOME/go
PATH=$PATH:$GOPATH/bin
# processingの設定
export PATH=$PATH:$HOME/processing-3.4/
export PATH=$PATH:/user/local/android-studio/bin/

# '#' 以降をコメントとして扱う
setopt interactive_comments
export PATH=~/swift-4.2.1-RELEASE-ubuntu18.04/usr/bin:$PATH
export ANDROID_EMULATOR_USE_SYSTEM_LIBS=1
alias open="xdg-open"

export LANG=ja_JP.UTF-8

autoload -Uz vcs_info
setopt prompt_subst
# --------------------------------------------------
#  カレントディレクトリ表示（左）
# --------------------------------------------------
 
PROMPT='
%F{blue}%B[%n]%(5~,%-1~/.../%2~,%~)%f
%F{green}%B$ %b%f'
 
# --------------------------------------------------
#  git branch状態を表示（右）
# --------------------------------------------------
 
 
# true | false
# trueで作業ブランチの状態に応じて表示を変える
zstyle ':vcs_info:*' check-for-changes false
# addしてない場合の表示
zstyle ':vcs_info:*' unstagedstr "%F{red}%B＋%b%f"
# commitしてない場合の表示
zstyle ':vcs_info:*' stagedstr "%F{yellow}%B★ %f"
# デフォルトの状態の表示
zstyle ':vcs_info:*' formats "%u%c%F{green}%B【 %b 】%f"
# コンフリクトが起きたり特別な状態になるとformatsの代わりに表示
zstyle ':vcs_info:*' actionformats '【%b | %a】'
 
precmd () { vcs_info }
 
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'
 
# --------------------------------------------------
#  gitコマンド補完機能セット
# --------------------------------------------------
 
# autoloadの文より前に記述
fpath=(~/.zsh/completion $fpath)
 
# --------------------------------------------------
#  コマンド入力補完
# --------------------------------------------------
 
# 補完機能有効にする
autoload -U compinit
compinit -u
 
# 補完候補に色つける
autoload -U colors
colors
zstyle ':completion:*' list-colors "${LS_COLORS}"
 
# 単語の入力途中でもTab補完を有効化
setopt complete_in_word
# 補完候補をハイライト
zstyle ':completion:*:default' menu select=1
# キャッシュの利用による補完の高速化
zstyle ':completion::complete:*' use-cache true
# 大文字、小文字を区別せず補完する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 補完リストの表示間隔を狭くする
setopt list_packed
 
# コマンドの打ち間違いを指摘してくれる
setopt correct
SPROMPT="correct: $RED%R$DEFAULT -> $GREEN%r$DEFAULT ? [Yes/No/Abort/Edit] => "
 
# --------------------------------------------------
#  $ cd 機能拡張
# --------------------------------------------------
 
# cdを使わずにディレクトリを移動できる
setopt auto_cd
# $ cd - でTabを押すと、ディレクトリの履歴が見れる
setopt auto_pushd
 
# --------------------------------------------------
#  $ tree でディレクトリ構成表示
# --------------------------------------------------
 
alias tree="pwd;find . | sort | sed '1d;s/^\.//;s/\/\([^/]*\)$/|--\1/;s/\/[^/|]*/| /g'"
 
# --------------------------------------------------
#  git エイリアス
# --------------------------------------------------
 
alias g="git"
compdef g=git
 
alias gs='git status --short --branch'
alias ga='git add -A'
alias gc='git commit -m'
alias gps='git push'
alias gpsu='git push -u origin'
alias gp='git pull origin'
alias gf='git fetch'
 
# logを見やすく
alias gl='git log --abbrev-commit --no-merges --date=short --date=iso'
# grep
alias glg='git log --abbrev-commit --no-merges --date=short --date=iso --grep'
# ローカルコミットを表示
alias glc='git log --abbrev-commit --no-merges --date=short --date=iso origin/html..html'
 
alias gd='git diff'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gb='git branch'
 
alias gm='git merge'
alias gr='git reset'
 
 
 
 
# コミット 3行用
function git_commit() {
	BUFFER='git commit -m "#'
	CURSOR=$#BUFFER
	BUFFER=$BUFFER'" -m "" -m ""'
}
zle -N git_commit
bindkey '^[git_commit' git_commit
 
# タブに名前を付ける
function tab_rename() {
	BUFFER="echo -ne \"\e]1;"
	CURSOR=$#BUFFER
	BUFFER=$BUFFER\\a\"
}
zle -N tab_rename
bindkey '^[tab_rename' tab_rename
 


# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000



# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

########################################
# 補完
# 補完機能を有効にする
autoload -Uz compinit
compinit

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'


########################################
# vcs_info
autoload -Uz vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

function _update_vcs_info_msg() {
    LANG=en_US.UTF-8 vcs_info
    RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg


########################################
# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

setopt ignore_eof

setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups

setopt share_history

setopt hist_ignore_all_dups

setopt hist_ignore_space

setopt hist_reduce_blanks

setopt extended_glob


bindkey '^R' history-incremental-pattern-search-backward


alias la='ls -a'
alias ll='ls -l'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'

        alias ls='ls -F --color=auto'

