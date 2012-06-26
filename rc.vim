" janisg .vim config

" Pathogen load
runtime bundle/vim-pathogen.git/autoload/pathogen.vim

filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on

set number    		" rindu numuri
set showtabline=2	" radit tabu rindinu visu laiku
set tabpagemax=15       " maximalais tabu skaits cik var atvert
set numberwidth=5	" cik plata ir ciparu kolona sanos
set showcmd   		" rada komandas
set incsearch 		" pieaugossa meklesana
set hlsearch		" hailaito searcha matchus
set showmatch		" radit machojoso iekavu
set textwidth=120   " teksta platums (kolonnu skaits)
set smartindent		" automatisko atkapju liksana, veel var but 'cindent' vai 'autoindent'
set expandtab		" tabu vieta uzliek tik spaces cik taba lielums
set shiftwidth=2	" atstarpes izmers kad lieto CTRL-T vai auto indentinga tuljus
set tabstop=2		" tab izmers spiezhot <TAB>
set laststatus=2	" vienmer radit statusrindu ari tad kad ir viens fails
set matchpairs=(:),{:},[:],<:> " kadus parus matchos uz %
set history=50		" komandu atminja
set ignorecase		" case insensitive mode
set smartcase		" ja ir kaut viens vards ar lielo burtu parversas par case sensitive
set statusline=\"%F\"\ %h%r%m[%l,%c%V][%p%%]%=[%L\ lines][%{&encoding}][FTYPE=%Y][FORMAT=%{&ff}]
set nobackup		" neglabat backup failu
set scrolloff=5    " skrolejot tekstu, cik rindas nepartraukti turet virs un zem kursora, lai nekad nesasniegtu lapas apaksu(augsu)
set wildmenu        " radit status komandu autocomplete
set grepprg=grep\ -nH\ $*
set clipboard+=unnamed " Yanks go on clipboard instead of "* register
set encoding=utf-8  " defaultais enkodings
set novisualbell    " netroksnot
set noerrorbells    " --- "" ---
set fileformats=unix,dos,mac " file type recognition

" swp file fix
set directory=~/.vim_tmp " backup files directory, instead of droping anywhere on fs

if has('mac')
  set guifont=Monaco:h10
elseif has('unix') && !has('mac')
  set guifont=Monospace\ 9
endif

" sessions
if has('mksession')
  set sessionoptions=blank,buffers,help,folds,options,tabpages,winsize,resize,sesdir
endif

if has('title')
  set title " show document title in statusbar of terminal
  set titlestring=%f%h%m%r%w\ -\ %{v:progname}@%{hostname()}\ -\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')}
endif

if has('syntax')
  syntax on
endif

if has("autocmd")
  autocmd! bufwritepost .vimrc source ~/.vim/rc.vim
endif


colorscheme zenburn
