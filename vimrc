" |  \/  |_   _  \ \   / /_ _|  \/  |  _ \ / ___|
" | |\/| | | | |  \ \ / / | || |\/| | |_) | |
" | |  | | |_| |   \ V /  | || |  | |  _ <| |___
" |_|  |_|\__, |    \_/  |___|_|  |_|_| \_\\____|
"         |___/

" Comments in Vimscript start with a `"`.

" If you open this file in Vim, it'll be syntax highlighted for you.

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
set nocompatible

set cursorline
autocmd InsertEnter * highlight CursorLine guibg=#004000 guifg=fg
autocmd InsertLeave * highlight CursorLine guibg=#004000 guifg=fg

""set cursorcolumn
""autocmd InsertEnter * highlight CursorColumn ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold
""autocmd InsertLeave * highlight CursorColumn ctermfg=Black ctermbg=Yellow cterm=bold guifg=Black guibg=yellow gui=NONE

" Turn on syntax highlighting.
syntax on

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" set cpoptions+=n

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" change the working directory to the one containing the file being edited. keep the working directory synchronized with the location of the current file.
set autochdir
" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.

set showcmd " show command in bottom bar

set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

" automatically use the + buffer (the system clipboard) by default. Then to yank (copy), you just use the regular y command, etc.
set clipboard=unnamed

" / in Normal mode, * in Normal mode will search for the next occurrence of the word under the cursor.  # will search for the previous occurrence of the word.
set hlsearch

" column left from the linenumbers 
" set foldcolumn=1

set foldmethod=marker

noremap H 7h
noremap J 7j
noremap K 7k
noremap L 7l

" set leader key
let mapleader = ","

set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces

" set auto indent
set autoindent


" set ,b to trigger CtrlPBuffer
nnoremap <leader>b :CtrlPBuffer<CR>

" enter space in normal mode
nnoremap <space> i<space><esc>

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" Automatically supplement parentheses, brackets, etc.
"inoremap ( ()<ESC>i
"inoremap [ []<ESC>i
"inoremap { {}<ESC>i
"inoremap " ""<ESC>i
"inoremap ' ''<ESC>i

" Prevent auto line split
set wrap " change line automatically
set tw=0 " set text width=0, ensure that Vim wraps lines based on the width of the window rather than a predefined textwidth.
set indentexpr= " disable indentexpr, turning off automatic indentation calculation based on an expression.

filetype on " required
filetype indent on  " required
filetype plugin on  " required
filetype plugin indent on " required

set nocompatible              " be iMproved, required
filetype off                  " required



" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
Plugin 'kien/ctrlp.vim' " fuzzy file finder
Plugin 'vim-airline/vim-airline'
" File navigation
Plugin 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } "文件树
" Git
Plugin 'tpope/vim-fugitive'
" Markdown
Plugin 'godlygeek/tabular' "对齐
" c++
Plugin 'Valloric/YouCompleteMe'
" c++ syntax
Plugin 'octol/vim-cpp-enhanced-highlight'
" python
Plugin 'davidhalter/jedi-vim'
" python syntax
Plugin 'vim-python/python-syntax'
" install with vundle: colorscheme molokai
Plugin 'tomasr/molokai'
" install with vundle: colorscheme lucius
Plugin 'jonathanfilip/vim-lucius'
" install with vundle: colorscheme everforest
Plugin 'sainnhe/everforest'
" install with vundle: colorscheme sacredforest
Plugin 'karoliskoncevicius/sacredforest-vim'
" underline cursor word
Plugin 'itchyny/vim-cursorword'
" auto add closing quotes...
Plugin 'ervandew/matchem' " https://github.com/ervandew/matchem
" Plugin 'Raimondi/delimitMate' " https://github.com/Raimondi/delimitMate

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


map tt :NERDTreeToggle<CR>
set encoding=utf-8

"colorscheme lucius
"LuciusBlackHighContrast
" colorscheme molokai


let g:everforest_background='hard'
let g:everforest_colors_override = {'bg0': ['#223c2c','235']}
colorscheme everforest
"colorscheme sacredforest
"set termguicolors

