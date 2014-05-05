filetype off
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle required!
Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'rking/ag.vim'
Bundle 'nono/jquery.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'ervandew/supertab'
Bundle 'godlygeek/tabular'
Bundle 'tomtom/tcomment_vim'
Bundle 'timcharper/textile.vim'
Bundle 'ap/vim-css-color'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-haml'
Bundle 'pangloss/vim-javascript'
Bundle 'tpope/vim-markdown'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-rails'
Bundle 'vim-ruby/vim-ruby'
Bundle 'goldfeld/vim-seek'
Bundle 'slim-template/vim-slim'
Bundle 'tpope/vim-surround'
Bundle 'sukima/xmledit'
Bundle 'mattn/emmet-vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'scrooloose/syntastic'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'kaichen/vim-snipmate-ruby-snippets'
Bundle 'mattn/gist-vim'
Bundle 'chriskempson/base16-vim'
Bundle 'mattn/webapi-vim'
Bundle 'edsono/vim-matchit'
Bundle 'vim-scripts/ruby-matchit.git'
Bundle 'danro/rename.vim'
Bundle 'jc00ke/vim-tomdoc'

execute pathogen#infect()

if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Color scheme
set t_Co=256
colorscheme base16-default

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
map <F3> :set spelllang=de spell<cr>
map <F4> :set spell<cr>
map <F5> :set nospell<cr>

imap <F2> <ESC>:set spelllang=en_us spell<cr>a
imap <F3> <ESC>:set spelllang=de spell<cr>a
imap <F4> <ESC>:set spell<cr>a
imap <F5> <ESC>:set nospell<cr>a

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

let g:ctrlp_working_path_mode = 0
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_max_files=0

" Ignore jekyll site folder
set wildignore+=*_site\/*

" Paste toggle
set pt=<f9>

" different tab color
hi TabLineSel ctermfg=Red ctermbg=Yellow

function! PhpTabs()
  set tabstop=4
  set softtabstop=4
  set shiftwidth=4
  set smarttab
  set expandtab
  set autoindent
  set smartindent
endfunction

" show a line if text is getting too long
set colorcolumn=+1 " highlight column after 'textwidth'
" set the color to a dark grey
highlight ColorColumn ctermbg=234

" Copy gists to clipboard by default
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let mapleader = ","

" Open the current Github file at the current line
nnoremap <leader>o :.Gbrowse <CR>

" Copy the current Github link of the current line
nnoremap <leader>oc :.Gbrowse! <CR>

" CTAGS quirks for German keyboard
" jump to tag on ä In normal mode
map ä <C-]>
" and jump back on ö
map ö <C-t>
