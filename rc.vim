" janisg .vim config

" Pathogen load
runtime bundle/vim-pathogen.git/autoload/pathogen.vim

filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on

set number    		" show line numbers
set showtabline=2	" show tab line all the time
set tabpagemax=15 " max number of tabs openable at once
set numberwidth=5	" width of line number column 
set showcmd   		" show commands
set incsearch 		" incremental search
set hlsearch		  " highlighted search matches
set showmatch		  " show matching brace
set textwidth=120 " text width (column count)
set smartindent		" automatic indenting (possible also 'cindent' and 'autoindent')
set expandtab		  " replace tabs with spaces
set shiftwidth=2	" space size when using auto indenting tools
set tabstop=2		  " tab width
set laststatus=2	" always show status bar, also when only single file is available
set matchpairs=(:),{:},[:],<:> " types of brackets to match with %
set history=50		" command memory size
set ignorecase		" case insensitive mode
set smartcase		  " if any word have capital letter, search automatically turns to case sensitive
set statusline=\"%F\"\ %h%r%m[%l,%c%V][%p%%]%=[%L\ lines][%{&encoding}][FTYPE=%Y][FORMAT=%{&ff}]
set nobackup		  " don't store backup 
set scrolloff=5   " lines to scroll above and below the cursor
set wildmenu      " status bar command autocomplete
set grepprg=grep\ -nH\ $*
set clipboard+=unnamed " Yanks go on clipboard instead of "* register
set encoding=utf-8
set novisualbell    " no noise
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
  autocmd! bufwritepost ~/.vim/rc.vim so ~/.vimrc
endif


if has("gui_running")
  colorscheme Monokai
else
  colorscheme zenburn
endif

" NERDCommenter
let NERDSpaceDelims = 1

nmap <silent> <F2> <leader>ci
imap <silent> <F2> <Esc><leader>cii
vmap <silent> <F2> <leader>ci
