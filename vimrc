" terminal color scheme
" The gui colorscheme is in .gvimrc
set t_Co=256
colorscheme desert256

" Deja Vu font
set guifont="DejaVu Sans Mono" 10

" enable syntax highlighting
syntax on
filetype on
filetype indent on
filetype plugin on

" syntax highlights for GLSL
au BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl setf glsl 

" enable line numbering
set number

" no linewrap
set nowrap

" Better highlighting for Python
let python_highlight_numbers = 1
let python_highlight_builtins = 1
let python_highlight_exceptions = 1

" Settings for netrw
let g:netrw_liststyle = 3
let g:netrw_browse_split = 0
let g:netrw_ftp_cmd="ftp -p"

" Highlight PHP templates as PHP
au BufNewFile,BufRead *.ctp setfiletype php
au BufNewFile,BufRead *.ctp setfiletype phtml

" Allow unsaved hidden buffers
set hidden

" Easy window switching
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Who doesn't like autoindent?
set autoindent

" Spaces are better than a tab character
set expandtab
set smarttab

" Who wants an 8 character tab?  Not me!
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Cool tab completion stuff
set wildmenu
set wildmode=list:longest,full

" Incremental searching is sexy
set incsearch

" Do not highlight things that we find with the search
set nohlsearch

set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

" Toggle search highligting
noremap <F3> :set hlsearch! hlsearch?<CR>

" NERDTree
noremap <F4> :NERDTreeToggle /home/sander/dev<CR>
let NERDTreeQuitOnOpen = 1

" Run makeprg
noremap <F5> :make<CR>

" Up and down are more logical with g..
nnoremap <silent> k gk
nnoremap <silent> j gj
inoremap <silent> <Up> <Esc>gka
inoremap <silent> <Down> <Esc>gja

" Do not highlight the cursorline
set nocursorline

" Zen settings
let g:user_zen_leader_key = '<c-y>'
let g:user_zen_settings = {
\    'php': {
\        'extends': 'html',
\        'filters': 'c',
\    },
\    'xml': {
\        'extends': 'html',
\    },
\    'haml': {
\        'extends': 'html',
\    },
\}

" Set Xdebug proxy port
let g:debuggerPort = 9009

" Syntastic
let g:syntastic_enable_signs = 1

" Folding
set foldmethod=marker
