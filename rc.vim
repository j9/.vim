" janisg .vim config

" Pathogen load
runtime bundle/vim-pathogen.git/autoload/pathogen.vim

" load Man page plugin, to read manpages with :Man
runtime! ftplugin/man.vim 

filetype off

call pathogen#infect()
call pathogen#helptags()

set nocp
filetype plugin indent on

set number                     " show line numbers
set showtabline=2              " show tab line all the time
set tabpagemax=15              " max number of tabs openable at once
set numberwidth=4              " width of line number column 
set showcmd                    " show commands
set incsearch                  " incremental search
set hlsearch                   " highlighted search matches
set showmatch                  " show matching brace
set textwidth=120              " text width (column count)
set smartindent                " automatic indenting (possible also 'cindent' and 'autoindent')
set noexpandtab                " replace tabs with spaces
set shiftwidth=2               " space size when using auto indenting tools
set tabstop=2                  " tab width
set laststatus=2               " always show status bar, also when only single file is available
set matchpairs=(:),{:},[:],<:> " types of brackets to match with %
set history=50                 " command memory size
set ignorecase                 " case insensitive mode
set smartcase                  " if any word have capital letter, search automatically turns to case sensitive
set statusline=\"%F\"\ %h%r%m[%l,%c%V][%p%%]%=[%L\ lines][%{&encoding}][FTYPE=%Y][FORMAT=%{&ff}]
set nobackup                   " don't store backup 
set scrolloff=5                " lines to scroll above and below the cursor
set wildmenu                   " status bar command autocomplete
set grepprg=grep\ -nH\ $*
set clipboard+=unnamed         " Yanks go on clipboard instead of "* register
set encoding=utf-8             " utf-8 FTW
set novisualbell               " no noise
set noerrorbells               " --- "" ---
set fileformats=unix,dos,mac   " file type recognition
set autochdir                  " change current working directory to the files location
set guioptions=aegiLr          " add +mT get the toolbar and menubar back
set list                       " show listings
set listchars=tab:\|\          " replace tabs with |\\\\\
set completeopt=longest,menu   " autocompletion menu setup

" swp file fix
set directory=~/.vim_tmp " backup files directory, instead of droping anywhere on fs

" set hostname and operating system dependent fonts and sizes
if has('mac')
  set guifont=Monaco:h10
elseif has('unix') && !has('mac')
  let s:hostname = substitute(system('hostname'), '\n', '', '')
  let s:fontsize = 8
  if s:hostname == "vafele"
    let s:fontsize = 9
  elseif s:hostname == "dex"
    let s:fontsize = 10
  endif
  execute ':set guifont=Monospace\ ' . s:fontsize
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


colorscheme Monokai

if has('cscope')
  set cscopetag
  set csto=0
  set cscopequickfix=s-,g-,c-,d-,t-,e-,f-,i-

  " add any database in current directory
  if filereadable("cscope.out")
    exe "cscope add cscope.out " . getcwd()
  elseif $CSCOPE_DB != ""
    cscope add $CSCOPE_DB
  endif

  " Using <Leader> then a search type makes the vim window
  " split horizontally, with search result displayed in
  " the new window.
  nmap <Leader>s :scs find s <C-R>=expand("<cword>")<CR><CR>
  nmap <Leader>g :scs find g <C-R>=expand("<cword>")<CR><CR>
  nmap <Leader>c :scs find c <C-R>=expand("<cword>")<CR><CR>
  nmap <Leader>t :scs find t <C-R>=expand("<cword>")<CR><CR>
  nmap <Leader>e :scs find e <C-R>=expand("<cword>")<CR><CR>
  nmap <Leader>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
  nmap <Leader>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
  nmap <Leader>d :scs find d <C-R>=expand("<cword>")<CR><CR>

  " Hitting <Leader> *twice* before the search type does a vertical
  " split instead of a horizontal one
  nmap <Leader><Leader>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
  nmap <Leader><Leader>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
  nmap <Leader><Leader>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
  nmap <Leader><Leader>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
  nmap <Leader><Leader>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
  nmap <Leader><Leader>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
  nmap <Leader><Leader>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
endif

" NERDCommenter
let NERDSpaceDelims = 1

nmap <silent> <F2> <leader>ci
imap <silent> <F2> <Esc><leader>cii
vmap <silent> <F2> <leader>ci

" vim-session plugin
let g:session_autoload = 'no'
let g:session_autosave = 'yes'

" PyMode settings
" Disable autofolding the code
let g:pymode_folding = 1
let g:pymode_rope_goto_def_newwin = 'new'
let g:pymode_rope_lookup_project = 1

let g:pymode_lint = 0
let g:pymode_lint_on_write = 1
" let g:pymode_lint_unmodified = 1
let g:pymode_lint_checkers = ['mccbe']
" let g:pymode_lint_checkers = ['pylint', 'pep8', 'pep257', 'mccbe']
let g:pymode_lint_sort = ['E', 'C', 'I']
" Which errors to ignore (see pylint codes)
"let g:pymode_lint_ignore = ""

" Disable syntax check for python files as that's handled by pymode
" let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['python'] }
let g:syntastic_python_checkers = ['pep8', 'pep257', 'pylint', 'python']
let g:syntastic_auto_loc_list = 1

" NERDTree
let NERDTreeIgnore=['\~$', '.pyc$[[file]]', '^cscope.*[[file]]', '.o$[[file]]']
nmap <silent> <special> <F3> :NERDTreeToggle<RETURN>

" Tagbar
nmap <silent> <special> <F4> :TagbarToggle<CR>

" Gundo
nnoremap <F5> :GundoToggle<CR>

"ctrlp.vim
let g:ctrlp_working_path_mode='ra'

"lineIndent
"let g:indentLine_color_term = 239
"let g:indentLine_color_gui = '#A4E57E'
"let g:indentLine_char = '│'

" writing read only files through sudo
cmap w!! w !sudo tee >/dev/null %

" shorter version for movement between windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" map Ctrl-S to save files (from wikia.com tips)
nnoremap <silent> <C-S> :if expand("%") == ""<CR>browse confirm w<CR>else<CR>confirm w<CR>endif<CR>
imap <C-s> <C-o><C-s>
vmap <C-s> <C-c><C-s>

" <Numbers> switching plugin
nnoremap <silent> <leader>n :NumbersToggle<CR>

function! MoveBuf(direction)
    let bufno = bufnr("%")
    hide
    exec "wincmd " . a:direction
    new
    exec "buffer " . bufno
endfunction

map <C-W><M-h> :call MoveBuf("h")<CR>
map <C-W><M-l> :call MoveBuf("l")<CR>
map <C-W><M-j> :call MoveBuf("j")<CR>
map <C-W><M-k> :call MoveBuf("k")<CR>

" custom tab labels, for easier navigation
function! GuiTabLabel()
    let label = ''
    let modified = ''
    let bufnrlist = tabpagebuflist(v:lnum)

    " Add '+' if one of the buffers in the tab page is modified
    for bufnr in bufnrlist
        if getbufvar(bufnr, "&modified")
            let modified = '+'
            break
        endif
    endfor

    " Append the number of windows in the tab page if more than one
    let wincount = tabpagewinnr(v:lnum, '$')
    let label .= wincount . modified . ' '

    " Append the buffer name (not full path)
    return "%N:" . label . "/ %t"
endfunction

set guitablabel=%!GuiTabLabel()

" fast tab switching
nmap <silent> <M-n> :tabnext<CR>
nmap <silent> <M-p> :tabprev<CR>

nmap <silent> <M-1> :tabnext 1<CR>
nmap <silent> <M-2> :tabnext 2<CR>
nmap <silent> <M-3> :tabnext 3<CR>
nmap <silent> <M-4> :tabnext 4<CR>
nmap <silent> <M-5> :tabnext 5<CR>
nmap <silent> <M-6> :tabnext 6<CR>
nmap <silent> <M-7> :tabnext 7<CR>
nmap <silent> <M-8> :tabnext 8<CR>
nmap <silent> <M-9> :tabnext 9<CR>

au FileType gitcommit set textwidth=72
au FileType gitcommit set colorcolumn=72
