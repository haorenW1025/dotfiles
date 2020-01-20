" floating window
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
set pumblend=20

if has("autocmd")
" Highlight TODO, FIXME, NOTE, etc.
autocmd Syntax * call matchadd('Todo', '\W\zs\(TODO\|FIXME\|CHANGED\|BUG\|HACK\)')
autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\)')
endif

" Terminal settings
highlight TermCursor ctermfg=red guifg=red

tnoremap <C-c> <C-\><C-n>

augroup neovim_terminal
	autocmd!

	" Disables number lines on terminal buffers
	autocmd TermOpen * :set nonumber norelativenumber
augroup END


" folding
set foldmethod=indent
set foldlevelstart=99
set foldlevel=99
autocmd BufWrite * mkview
autocmd BufRead * silent! loadview
set formatoptions-=cro

set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess=atI
set signcolumn=yes

" tab
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4 " the visible width of tabs
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftwidth=4 " number of spaces to use for indent and unindent
set expandtab
autocmd filetype javascript vue setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
set shiftround " round indent to a multiple of 'shiftwidth'
set nowrap
set nolinebreak
set textwidth=0 
set wrapmargin=0


autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline
cnoremap <c-n> <down>
cnoremap <c-p> <up>

nnoremap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>
set termguicolors
set complete=.,w,b,u,t,kspell
set encoding=utf8
set ttyfast
set lazyredraw
set synmaxcol=200
set cul!
set noerrorbells
set visualbell
set t_vb=
set tm=500
set autoread
set backspace=indent,eol,start
set shellpipe=>
set ruler
set history=100
set wildmode=list:longest:full
set splitbelow splitright
set wildmenu
set ignorecase
set cursorline
set hlsearch
set incsearch
set so=5
set bg=dark
set relativenumber
set mouse=v
set t_Co=256
set ai
set si
