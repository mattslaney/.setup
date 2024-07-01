"" ==============
"" BASIC SETTINGS
"" --------------

set nocompatible
filetype on
set history=500
let mapleader = " "

" sudo save!
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

"" ===============
"" EDITOR SETTINGS
"" ---------------

set relativenumber
syntax enable
set regexpengine=0
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set scrolloff=10

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

""
""
""

set incsearch
set visualbell

"" ===============
"" VISUAL SETTINGS
"" ---------------

" Added so colours work well with alacritty, tmux and vim
if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

syntax on
set termguicolors

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
   set t_Co=256
endif

" Set the theme
try
    colorscheme sorbet
catch
    highlight Comment ctermfg=LightBlue
endtry
highlight Normal ctermbg=none

" 
" set colorcolumn
set cursorline
set cursorcolumn
set colorcolumn=80,120

"" ===========
"" STATUS LINE
"" -----------

set statusline=
set statusline+=\ %F\ %M\ %Y\ %R " Status Left
set statusline+=%= " Status Divider
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%% " Status Right
set laststatus=2 " Show the status on the second to last line.
