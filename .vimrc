" Needed on some linux distros.
" see http://www.adamlowe.me/2009/12/vim-destroys-all-other-rails-editors.html
filetype off 
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Color scheme
set t_Co=256
"colorscheme sunburst
colorscheme base16-default
" colorscheme molokai

" Display line numbers
set number

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif


" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd    " Show (partial) command in status line.
set showmatch   " Show matching brackets.
set ignorecase    " Do case insensitive matching
set smartcase   " Do smart case matching
set incsearch   " Incremental search
set autowrite   " Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
set mouse=a   " Enable mouse usage (all modes)


" Smart completion
function! SmartComplete()
  let line = getline('.')                         " curline
  let substr = strpart(line, -1, col('.')+1)      " from start to cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"                         " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  else
    return "\<C-X>\<C-O>"                         " plugin matching
  endif
endfunction

" Call smart completion when pressing Ctrl-Space
inoremap <C-Space> <c-r>=SmartComplete()<CR>
imap <C-@> <C-Space>

set textwidth=78

" Folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

" Disable help
map <F1> <Esc>
imap <F1> <Esc>

" Spell Check
map <F2> :set spelllang=en_us spell<cr>
map <F3> :set spelllang=fr spell<cr>
map <F4> :set nospell<cr>
map <F5> :set spell<cr>

imap <F2> <ESC>:set spelllang=en_us spell<cr>a
imap <F3> <ESC>:set spelllang=fr spell<cr>a
imap <F4> <ESC>:set nospell<cr>a
imap <F5> <ESC>:set spell<cr>a

" Snipmate info
let g:snips_author = 'Hendrik Kleinwaechter'

set expandtab     "soft tabs
set tabstop=2     "set tabstops
set shiftwidth=2  "set shiftwidth
set softtabstop=2 "delete this many spaces upon deleting soft tab

" Zen Coding configuration
let g:user_zen_settings = {
\ 'php' : {
\   'extends' : 'html',
\   'filters' : 'c',
\ },
\ 'xml' : {
\   'extends' : 'html',
\ },
\}

" Refresh a file when modified from the outside
set autoread

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vim_runtime/vimrc

set nobackup
set nowb
set noswapfile

nmap t o<ESC>k
nmap T O<ESC>j
inoremap jj <Esc>
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" i hate tabs, pls show em
set list
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

" Reselect visual blocks
vnoremap < <gv
vnoremap > >gv

" Y should behave like other capitals
map Y y$

" Better line movements
nnoremap j gj
nnoremap k gk

" Trailing whitespaces
highlight WhitespaceEOL ctermbg=Red guibg=Red
match WhitespaceEOL /\s\+$/

" useful statusline
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set title

" Auto complete brackets
imap { {}<left>
imap ( ()<left>
imap [ []<left>

imap ,/ </<C-X><C-O>

set hlsearch

set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
