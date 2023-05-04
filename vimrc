set nocompatible               " be iMproved
filetype off                   " required!

" Init Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Bundles
Bundle 'FooSoft/vim-argwrap'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'SirVer/ultisnips'
Bundle 'austintaylor/vim-commaobject'
Bundle 'bufexplorer.zip'
Bundle 'delimitMate.vim'
Bundle 'ervandew/supertab'
Bundle 'jakobwesthoff/argumentrewrap'
Bundle 'joonty/vdebug.git'
Bundle 'kien/ctrlp.vim'
Bundle 'leafgarland/typescript-vim'
Bundle 'lepture/vim-jinja'
Bundle 'majutsushi/tagbar'
Bundle 'matchit.zip'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'mileszs/ack.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'phpactor/phpactor'
Bundle 'posva/vim-vue'
Bundle 'sandermarechal/emptylines'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'sickill/vim-pasta'
Bundle 'tobyS/pdv'
Bundle 'tobyS/skeletons.vim'
Bundle 'tobyS/vimtip'
Bundle 'tobyS/vmustache'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'vim-php/vim-php-refactoring'


" Color schemes
Bundle 'Wombat'
Bundle 'desert256.vim'

" Required after Vundle did its job.
filetype plugin indent on     " required!

" Swap file location
set directory=~/.vim/swapfiles//

" terminal color scheme
" The gui colorscheme is in .gvimrc
set t_Co=256
colorscheme desert256

" GUI font settings
set guifont=Hack\ 9

" enable syntax highlighting
syntax on

" Better highlighting for Python
let python_highlight_numbers = 1
let python_highlight_builtins = 1
let python_highlight_exceptions = 1

" Better highlighting for HTML
let html_no_rendering = 1

" Extra filetypes
au BufNewFile,BufRead *.ctp setfiletype php
au BufNewFile,BufRead *.ctp setfiletype phtml
au BufNewFile,BufRead *.phps setfiletype php
autocmd BufRead *.twig set filetype=jinja
autocmd BufRead *.html.twig set filetype=jinja

" enable line numbering
set number

" no linewrap
set nowrap

" Do not highlight the cursorline
set nocursorline

" Indenting
set indentexpr=
set autoindent
set smartindent

" Spaces are better than a tab character
set expandtab
set smarttab

" Who wants an 8 character tab?  Not me!
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Allow unsaved hidden buffers
set hidden

" Search settings
set incsearch
set nohlsearch
set smartcase
set ignorecase

" Pasting
set nopaste

" Cool tab completion stuff
set wildmenu
set wildmode=list:longest,full

" Status line
set laststatus=2
set statusline=%F%{fugitive#statusline()}%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

" Line endings
set nofixendofline

" Settings for netrw
let g:netrw_liststyle = 3
let g:netrw_browse_split = 0
let g:netrw_ftp_cmd="ftp -p"

" Easy window switching
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Toggle search highligting
noremap <F3> :set hlsearch! hlsearch?<CR>

" NERDTree
noremap <F4> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1

" Run makeprg
noremap <F5> :make<CR>

" Up and down are more logical with g..
nnoremap <silent> k gk
nnoremap <silent> j gj

" Re-select after visual mode indent
vnoremap < <gv
vnoremap > >gv

" Force writing files that require root privilege
cmap w!! %!sudo tee > /dev/null %

" Disable bells
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Remap arrow keys
nnoremap <silent> <Up> :call DelEmptyLineAbove()<CR>
nnoremap <silent> <Down> :call AddEmptyLineAbove()<CR>
nnoremap <silent> <C-Up> :call DelEmptyLineBelow()<CR>
nnoremap <silent> <C-Down> :call AddEmptyLineBelow()<CR>
nnoremap <silent> <Left> <<
nnoremap <silent> <Right> >>
vmap <silent> <Up> [egv
vmap <silent> <Down> ]egv
vnoremap <silent> <Left> <gv
vnoremap <silent> <Right> >gv
imap <silent> <Up> <Esc>[ei
imap <silent> <Down> <Esc>]ei
inoremap <silent> <Left> <C-D>
inoremap <silent> <Right> <C-T>

" Enable customized non-visible character display
" http://vimcasts.org/episodes/show-invisibles/
nnoremap <leader>L :set list!<CR>

" MovingThroughCamelCaseWords
nnoremap <silent><C-h>  :<C-u>cal search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%^','bW')<CR>
nnoremap <silent><C-l> :<C-u>cal search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%$','W')<CR>

" Toggle paste with <ins>
set pastetoggle=<ins>

" Go to insert mode when <ins> pressed in normal mode
nnoremap <silent> <ins> :setlocal paste!<CR>i

" Switch paste mode off whenever insert mode is left
autocmd InsertLeave <buffer> se nopaste

" Undo history between sessions
" set undodir=~/.vim/undodir
" set undofile
" set undolevels=1000 "maximum number of changes that can be undone
" set undoreload=10000 "maximum number lines to save for undo on a buffer reload

" Colored column (to see line size violations)
" set colorcolumn=80

" Edit Files relative to me
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Configure Ultisnips
let g:UltiSnipsExpandTrigger = "<Tab>"
let g:UltiSnipsJumpForwardTrigger = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger = "<S-Tab>"
let g:UltiSnipsListSnippets = "<M-Tab>"

" Set a custom snippets directory
let g:UltiSnipsSnippetsDir = $HOME . "/.vim/ultisnips/"
let g:UltiSnipsSnippetDirectories = ["ultisnips"]

" Configure PDV
let g:pdv_template_dir = $HOME . "/.vim/templates/pdv/"
nnoremap <buffer> <C-P> :call pdv#DocumentWithSnip()<CR>

" Argumentrewrap binding
nnoremap <silent> <leader>s :call argumentrewrap#RewrapArguments()<CR>

" Map ; to add ; to the end of the line, when missing
nnoremap <buffer> ; :s/\([^;]\)$/\1;/<cr>

" Screen redraw
nnoremap <buffer> <M-r> :redraw!<CR>

" VIMTips
let g:vimtip_tips = []
call add(g:vimtip_tips, "Extract selection into private method <\\\\em>")
call add(g:vimtip_tips, "Extract argument into variable <\\\\ev>")
call add(g:vimtip_tips, "Extract local variable into class property <\\\\ep>")
call add(g:vimtip_tips, "Rename local variable <\\\\rlv>")
call add(g:vimtip_tips, "Rename class variable <\\\\rcv>")
call add(g:vimtip_tips, ":UltiSnipsEdit to edit snips for current filetype")
call add(g:vimtip_tips, ":e %% to edit file in current directory")
call add(g:vimtip_tips, "Smart rename with :Subvert/parent{,s}/child{,ren}/g")
call add(g:vimtip_tips, "Use <\\\\s> to rewrap long argument list on multiple lines")
call add(g:vimtip_tips, "<,> is a comma text object")
call add(g:vimtip_tips, ":Gstatus, :Gcommit, :Gdiff and :Gblame")

autocmd VimEnter * call vimtip#NextTip()
autocmd WinEnter * call vimtip#NextTip()

" Fugitive
autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif

autocmd BufReadPost fugitive://* set bufhidden=delete

set tags^=./.git/tags;

" Include host-specific config
let hostfile='vimrc-' . hostname()
exe 'runtime! ' . hostfile

" Syntastic
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['php'],
                           \ 'passive_filetypes': ['yaml']}

let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd', 'phpstan']

let g:syntastic_php_phpcs_args = '--report=csv --standard=PSR2'
let g:syntastic_php_phpstan_args = '-c /usr/local/share/php/phpstan.neon'

" delimitMate settings
let delimitMate_autoclose=1
let delimitMate_expand_space=1
let delimitMate_expand_cr=1

" Tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_autoclose=1

" phpcomplete. Jump defninition manually set in php.vim ftplugin
let g:phpcomplete_parse_docblock_comments = 1
let g:phpcomplete_enhance_jump_to_definition = 0

" phpactor
autocmd FileType php setlocal omnifunc=phpactor#Complete
nmap <Leader>u :call phpactor#UseAdd()<CR>
nmap <Leader>mm :call phpactor#ContextMenu()<CR>
nmap <Leader>o :call phpactor#GotoDefinition()<CR>)

" Supertab
let g:SuperTabDefaultCompletionType = "context"

" Argument wrapping
nnoremap <silent> <leader>a :ArgWrap<CR>

" Force vertical diffs
set diffopt+=vertical

" Strip trailing whitespace on save
" autocmd FileType c,cpp,java,php,js autocmd BufWritePre <buffer> %s/\s\+$//e

" Lilypond, manually copied from lilypond directory
filetype off
set runtimepath+=/home/sander/.vim/bundle/lilypond
filetype on

" Horizontal scrolling with mouse
nnoremap <C-ScrollWheelUp> <ScrollWheelLeft>
nnoremap <C-2-ScrollWheelUp> <2-ScrollWheelLeft>
nnoremap <C-3-ScrollWheelUp> <3-ScrollWheelLeft>
nnoremap <C-4-ScrollWheelUp> <4-ScrollWheelLeft>
nnoremap <C-ScrollWheelDown> <ScrollWheelRight>
nnoremap <C-2-ScrollWheelDown> <2-ScrollWheelRight>
nnoremap <C-3-ScrollWheelDown> <3-ScrollWheelRight>
nnoremap <C-4-ScrollWheelDown> <4-ScrollWheelRight>

" Force 4-wide tabs in yaml
let g:yaml_recommended_style=0

" Show syntax region
function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

if filereadable(expand("~/.vim/vimrc.local"))
    source ~/.vim/vimrc.local
endif
