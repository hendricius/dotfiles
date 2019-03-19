filetype off
set nocompatible               " be iMproved
filetype off                   " required!

" Install plug.vim
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()

" let Vundle manage Vundle required!
Plug 'gmarik/vundle'
Plug 'rking/ag.vim'
Plug 'nono/jquery.vim'
Plug 'scrooloose/nerdtree'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'tomtom/tcomment_vim'
Plug 'timcharper/textile.vim'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rbenv'
Plug 'pangloss/vim-javascript'
Plug 'vim-ruby/vim-ruby'
Plug 'goldfeld/vim-seek'
Plug 'sukima/xmledit'
Plug 'mattn/emmet-vim'
Plug 'kchmck/vim-coffee-script'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'mattn/gist-vim'
Plug 'chriskempson/base16-vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'https://github.com/adelarsq/vim-matchit'
Plug 'danro/rename.vim'
Plug 'jc00ke/vim-tomdoc'
Plug 'groenewege/vim-less'
Plug 'esneider/YUNOcommit.vim'
Plug 'jnurmine/Zenburn'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'https://github.com/AndrewRadev/splitjoin.vim.git'
Plug 'scrooloose/syntastic'
Plug 'slim-template/vim-slim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ck3g/vim-change-hash-syntax'
Plug 'junegunn/vim-emoji'
Plug 'StanAngeloff/php.vim'
Plug 'exu/pgsql.vim'
Plug 'autowitch/hive.vim'
Plug 'henrik/vim-reveal-in-finder'
Plug 'evidens/vim-twig'
Plug 'jelera/vim-javascript-syntax'
Plug 'ElmCast/elm-vim'
Plug 'othree/html5.vim'
Plug 'isRuslan/vim-es6'
Plug 'scrooloose/nerdcommenter'
Plug 'rust-lang/rust.vim'
Plug 'itchyny/lightline.vim'
Plug 'editorconfig/editorconfig-vim'

call plug#end()

if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark
" set background=light

" Color scheme
set t_Co=256
" Sometimes needed for some terminals:
" let base16colorspace=256
colorscheme base16-default-dark
" colorscheme solarized
" colorscheme base-16-grayscale

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
" set showcmd    " Show (partial) command in status line.
set showmatch   " Show matching brackets.
set ignorecase  " Do case insensitive matching
set smartcase   " Do smart case matching
set incsearch   " Incremental search
set autowrite   " Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
set mouse=a   " Enable mouse usage (all modes)

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

" Refresh a file when modified from the outside
set autoread

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vim_runtime/vimrc

set nobackup
set nowb
set noswapfile

" new lines
nnoremap <C-J> m`o<Esc>``
nnoremap <C-K> m`O<Esc>``

inoremap jj <Esc>
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" show all linebreak chars.
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

" Use AG instead of grep
set grepprg=ag\ --nogroup\ --nocolor

" CtrlP Configuration
let g:ctrlp_working_path_mode = 0
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_max_files=0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_match_window = 'bottom,order:ttb,min:10,max:10'

" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
let g:ctrlp_user_command =
  \ 'ag %s --files-with-matches -g "" --ignore "\.git$\|\.hg$\|\.svn$"'

"
" ag is fast enough that CtrlP doesn't need to cache
"
let g:ctrlp_use_caching = 0

" Default to filename searches - so that appctrl will find application
" controller
" let g:ctrlp_by_filename = 1

" Don't jump to already open window. This is annoying if you are maintaining
" several Tab workspaces and want to open two windows into the same file.
let g:ctrlp_switch_buffer = 0

" Additional mapping for buffer search
nnoremap <silent> ,b :CtrlPBuffer<cr>

" Paste toggle
set pt=<f9>

" this turns off physical line wrapping (ie: automatic insertion of newlines)
map <F10> <ESC>:set textwidth=0 wrapmargin=0<cr>
imap <F10> <ESC>:set textwidth=0 wrapmargin=0<cr>a

" different tab color
hi TabLineSel ctermfg=Red ctermbg=Yellow

" show a line if text is getting too long
set colorcolumn=+1 " highlight column after 'textwidth'
" set the color to a dark grey
highlight ColorColumn ctermbg=234

" Copy gists to clipboard by default
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_post_private = 1

" Change default leader
let mapleader = ","

" Open the current Github file at the current line
nnoremap <leader>o :.Gbrowse <CR>

" Copy the current Github link of the current line
nnoremap <leader>oc :.Gbrowse! <CR>

" CTAGS quirks for German keyboard
" jump to tag on ä In normal mode
map ö <C-]>
" and jump back on ö
map ä <C-t>

" bind K to Ag word under cursor
nnoremap K :Ag <C-R><C-W><CR>:cw<CR>

" Fugive to open git status
nnoremap <leader>gs :Gstatus<CR>

" Autosave when focus lost.
autocmd BufLeave,FocusLost * silent! wall

" Toggle Nerdtree
nnoremap <leader>N :NERDTreeToggle<CR>
nnoremap <leader>M :NERDTreeFind<CR>

" Backspace should behave normally
set backspace=indent,eol,start

" shortcut for searching files
map <c-l> :FZF<CR>

set rtp+=/usr/local/opt/fzf

" emoji auto complete
set completefunc=emoji#complete

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" disable sql plugin
let g:loaded_sql_completion = 0
let g:omni_sql_no_default_maps = 1

" NerdCommenter
let g:NERDSpaceDelims = 1 " Space after comments
let g:NERDDefaultAlign = 'left' " Put comment delimiters to left instead
let g:NERDTrimTrailingWhitespace = 1

" Make sure we properly detect hive scripts
au BufNewFile,BufRead *.hql set filetype=hive expandtab
