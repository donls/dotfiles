set nocompatible
set autoindent showmatch shiftwidth=4 report=1 number wrapmargin=0 tabstop=4
set nosmartindent expandtab

syntax enable
highlight Comment ctermfg=white

set ruler
set showcmd
set showmode

" Better Searching
set incsearch
set ignorecase
set smartcase

set hlsearch

set history=5000
set virtualedit=block

set smarttab
set softtabstop=4
set shiftround

" These settings are done in $VIM/vimrc now,
" so these lines can be ignored.
" set backupdir-=.
" set backupdir=
" set backupdir^=~/tmp,/tmp
"
" set backupdir-=.
" set backupdir=
" Addition of double delimiter causes full pathname to be saved
" set backupdir^=~/tmp//,/tmp//

set wildmode=longest,list

filetype plugin indent on
syntax on

