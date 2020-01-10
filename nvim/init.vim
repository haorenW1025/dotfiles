syntax enable
syntax on
set nocompatible
set number
call plug#begin('~/.vim/plugged') 
    let mapleader = " "
	let maplocalleader = "="
    " themes
	Plug 'junegunn/seoul256.vim'
	Plug 'mhartington/oceanic-next'

	Plug 'dhruvasagar/vim-table-mode'
	Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

	Plug 'junegunn/fzf.vim'
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
		nmap <leader>ff :Files<CR>
		nmap <leader>fg :Gfiles<CR>
		nmap <leader>fm :History<CR>
		nmap <leader>fb :BD<CR>
		nmap <leader>sn :Snippets<CR>
        nmap <leader><tab> <plug>(fzf-maps-n)
        xmap <leader><tab> <plug>(fzf-maps-x)
        omap <leader><tab> <plug>(fzf-maps-o)
		nmap <leader>ss :Rg<CR>
		nmap <leader>sc :Rg <c-r>=expand("<cword>")<CR><CR>


		command! -bang -nargs=? -complete=dir Files
			\ call fzf#vim#files(<q-args>, fzf#vim#with_preview('right:70%'), <bang>0)

		command! -bang -nargs=? -complete=dir GFiles
			\ call fzf#vim#files(<q-args>, fzf#vim#with_preview('right:70%'), <bang>0)

		command! -bang -nargs=? -complete=dir History
			\ call fzf#vim#history(fzf#vim#with_preview('right:70%'), <bang>0)

		command! -bang -nargs=* Rg
		\ call fzf#vim#grep(
		\   'rg --max-columns=80 --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 2,
		\   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:60%'),  <bang>0)

		autocmd BufWinEnter,WinEnter term://* startinsert

		let $FZF_DEFAULT_OPTS = "--layout=reverse --color fg:230,bg:238,hl:65,fg+:15,bg+:234,hl+:108 --color info:108,prompt:109,spinner:108,pointer:168,marker:168"
		'
		let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }

		function! Bufs()
			redir => list
			silent ls
			redir END
			return split(list, "\n")
		endfunction

		command! BD call fzf#run(fzf#wrap({
		\ 'source': Bufs(),
		\ 'sink*': { lines -> execute('bwipeout '.join(map(lines, {_, line -> split(line)[0]}))) },
		\ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
		\ }))




	Plug 'scrooloose/nerdcommenter'
		let g:NERDSpaceDelims = 1
		let g:NERDTrimTrailingWhitespace = 1
		let g:NERDCompactSexyComs = 1

	Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
		nmap \ :Defx<CR>
		nmap <leader>\ :Defx `expand('%:p:h')` -search=`expand('%:p')`<CR>
		autocmd FileType defx call s:defx_my_settings()

		autocmd BufEnter * if winnr('$') == 1  && &filetype ==# 'defx' | execute "normal! :q!\<CR>" | endif

		function! s:defx_my_settings() abort
			nnoremap <silent><buffer><expr> <CR>
				\ defx#is_directory() ?
				\ defx#do_action('open_or_close_tree') :
				\ defx#do_action('drop',)
			nmap <silent><buffer><expr> <2-LeftMouse>
				\ defx#is_directory() ?
				\ defx#do_action('open_or_close_tree') :
				\ defx#do_action('drop',)
			nnoremap <silent><buffer><expr> s defx#do_action('multi', [['drop', 'split'], 'quit'])
			nnoremap <silent><buffer><expr> v defx#do_action('multi', [['drop', 'vsplit'], 'quit'])
			nnoremap <silent><buffer><expr> t defx#do_action('multi', [['drop', 'tabnew'], 'quit'])
			nnoremap <silent><buffer><expr> o defx#do_action('open_tree')
			nnoremap <silent><buffer><expr> l defx#do_action('open_directory')
			nnoremap <silent><buffer><expr> O defx#do_action('open_tree_recursive')
			nnoremap <silent><buffer><expr> c defx#do_action('copy')
			nnoremap <silent><buffer><expr> p defx#do_action('paste')
			nnoremap <silent><buffer><expr> m defx#do_action('rename')
			nnoremap <silent><buffer><expr> d defx#do_action('remove_trash')
			nnoremap <silent><buffer><expr> a defx#do_action('new_file')
			nnoremap <silent><buffer><expr> A defx#do_action('new_directory')
			nnoremap <silent><buffer><expr> yy defx#do_action('yank_path')
			nnoremap <silent><buffer><expr> ~ defx#do_action('cd')
			nnoremap <silent><buffer><expr> h defx#do_action('cd', ['..'])
			nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
			nnoremap <silent><buffer><expr> ; defx#do_action('toggle_select')
			nnoremap <silent><buffer><expr> r defx#do_action('redraw')
			nnoremap <silent><buffer><expr> j  line('.') == line('$') ? 'gg' : 'j'
			nnoremap <silent><buffer><expr> q defx#do_action('quit')
			nnoremap <silent><buffer><expr> cd defx#do_action('change_vim_cwd')
		endfunction

		" Defx git
		Plug 'kristijanhusak/defx-git'
			let g:defx_git#indicators = {
				\ 'Modified'  : '✹',
				\ 'Staged'    : '✚',
				\ 'Untracked' : '✭',
				\ 'Renamed'   : '➜',
				\ 'Unmerged'  : '═',
				\ 'Ignored'   : '☒',
				\ 'Deleted'   : '✖',
				\ 'Unknown'   : '?'
			\ }
			let g:defx_git#column_length = 0
			hi def link Defx_filename_directory NERDTreeDirSlash
			hi def link Defx_git_Modified Special
			hi def link Defx_git_Staged Function
			hi def link Defx_git_Renamed Title
			hi def link Defx_git_Unmerged Label
			hi def link Defx_git_Untracked Tag
			hi def link Defx_git_Ignored Comment

		" Defx icons
		Plug 'whz861025/defx-icons'
		" disbale syntax highlighting to prevent performence issue
			let g:defx_icons_column_length = 2
			let g:defx_icons_enable_syntax_highlight = 1
			let g:defx_icons_directory_icon=''
			let g:defx_icons_parent_icon=''
			let g:defx_icons_root_opened_tree_icon=''
			let g:defx_icons_nested_opened_tree_icon=''
			let g:defx_icons_nested_closed_tree_icon=''
			let g:defx_icons_term_colors = {
				\ 'yellow': 178	,
				\ 'white' : 248,
				\ 'darkBlue' : 74,
				\ 'blue' : 81
				\ }
			let g:defx_icons_gui_colors = {
				\ 'blue' : '5fd7ff',
				\ 'yellow' : 'd7af00',
				\ 'darkBlue' : '5fafd7'
			  \ }


    " syntax highlighting
	Plug 'sheerun/vim-polyglot'

	Plug 'jiangmiao/auto-pairs'
		let g:AutoPairsShortcutFastWrap="jw"

    " status line
	Plug 'itchyny/lightline.vim'
        set showtabline=2
        let g:lightline = {
            \ 'colorscheme': 'seoul256',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [  'gitbranch', 'readonly', 'filename', 'modified' ] ]
            \ },
            \ 'component_function': {
            \   'gitbranch': 'fugitive#head',
            \ }
			\ }

    " mark showing 
    Plug 'kshenoy/vim-signature'

	" different color for parentheses
    Plug 'luochen1990/rainbow' 
        let g:rainbow_active = 1
        let g:rainbow_conf = {
        \	'guifgs': ['white', 'lightcyan', 'lightred', 'red', 'blue', 'darkgray'],
        \	'ctermfgs': ['white', 'yellow', 'lightcyan', 'red', 'blue', 'darkgray'],
        \	'guis': [''],
        \	'cterms': [''],
        \	'operators': '_,_',
        \	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
        \	'separately': {
        \		'*': {},
        \		'markdown': {
        \			'parentheses_options': 'containedin=markdownCode contained', 
        \		},
        \		'lisp': {
        \			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'], 
        \		},
        \		'haskell': {
        \			'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/\v\{\ze[^-]/ end=/}/ fold'], 
        \		},
        \		'vim': {
        \			'parentheses_options': 'containedin=vimFuncBody', 
        \		},
        \		'perl': {
        \			'syn_name_prefix': 'perlBlockFoldRainbow', 
        \		},
        \		'stylus': {
        \			'parentheses': ['start=/{/ end=/}/ fold contains=@colorableGroup'], 
        \		},
        \		'css': 0, 
        \	}
        \}

    " surround & repeat 
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-abolish'

    " git wrapper
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
		nmap <Leader>gw :Gwrite<CR>
		nmap <Leader>gc :Gcommit<CR>
        nmap <silent> <leader>gs :Gstatus<cr>
        nmap <leader>ge :Gedit<cr>
        nmap <silent><leader>gr :Gread<cr>
        nmap <silent><leader>gb :Gblame<cr>
		nmap <leader>gph :Gpush<CR>
		nmap <leader>gpl :Gpull<CR>
		nmap ]h <Plug>(GitGutterNextHunk)
		nmap [h <Plug>(GitGutterPrevHunk)
		nmap <leader>ghp <Plug>(GitGutterPreviewHunk)
		nmap <leader>ghu <Plug>(GitGutterUndoHunk)
		nmap <leader>ghs <Plug>(GitGutterStageHunk)


	Plug 'mg979/vim-visual-multi'
		nmap  <Leader>m  <Plug>(VM-Mouse-Word)  
		let g:VM_maps = {}
		let g:VM_leader = "="
		let g:VM_maps["Select Cursor Down"] = '<Down>'      " start selecting down
		let g:VM_maps["Select Cursor Up"]   = '<Up>'        " start selecting up

    " show indent
    Plug 'Yggdroot/indentLine'
	

    " language server : autocomplete, snippets support, goto action
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
        let g:coc_global_extensions = [
        \ 'coc-css',
		\ 'coc-python',
		\ 'coc-ultisnips',
        \ 'coc-json',
        \ 'coc-tsserver',
        \ 'coc-sh',
        \ ]

        " use tab for autocomplete
        inoremap <silent><expr> <TAB>
              \ pumvisible() ? "\<C-n>" :
              \ <SID>check_back_space() ? "\<TAB>" :
              \ coc#refresh()
        inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
        function! s:check_back_space() abort
          let col = col('.') - 1
          return !col || getline('.')[col - 1]  =~# '\s'
        endfunction
        " mapping for goto function
        nmap <silent>gd <Plug>(coc-definition)
		nmap <silent>tgd call CocAction('jumpDefinition', 'tab')
        nmap <silent>gy <Plug>(coc-type-definition)
        nmap <silent>gi <Plug>(coc-implementation)
        nmap <silent>gr <Plug>(coc-references)
        nmap <silent> <leader>d  :CocList diagnostics<cr>
        nmap <silent> [d <Plug>(coc-diagnostic-prev)
        nmap <silent> ]d <Plug>(coc-diagnostic-next)
        nmap <silent> <leader>/ :CocList words<cr>
        nmap <leader><leader>f  <Plug>(coc-format-selected)
		nmap <silent> <leader>rn :CocCommand document.renameCurrentWord
        nnoremap <silent> K :call <SID>show_documentation()<CR>
        inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : 
                                                   \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

        command! -nargs=0 Format :call CocAction('format')
        command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
		nmap <leader>for :Format<CR>


            function! s:show_documentation()
                if (index(['vim','help'], &filetype) >= 0)
                    execute 'h '.expand('<cword>')
                else
                    call CocAction('doHover')
                endif
            endfunction


    " ctags support : show classes, function and more
    Plug 'liuchengxu/vista.vim'
        let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
		let g:vista_default_executive = 'ctags'
        let g:vista_fzf_preview = ['right:70%']
		let g:vista_ignore_kinds = ['variable']
		let g:vista_sidebar_width = 40
        let g:vista#renderer#enable_icon = 1
		let g:vista_echo_cursor_strategy = 'floating_win'
        nmap <silent> , :Vista!!<CR>
		nmap <leader>st :Vista finder<CR>
		autocmd BufEnter * if winnr("$") == 1 && vista#sidebar#IsVisible() | execute "normal! :q!\<CR>" | endif

    " snippets setup
    Plug 'SirVer/ultisnips'
    Plug 'whz861025/vim-snippets'
		let g:UltiSnipsSnippetDirectories = ["~/.vim/plugged/vim-snippets/UltiSnips/"]
        let g:UltiSnipsEditSplit="vertical"
        let g:UltiSnipsExpandTrigger="<c-n>"
        let g:ultisnips_python_style="google"
		let g:UltiSnipsJumpForwardTrigger="jl"
		let g:ultisnipsjumpbackwardtrigger="jh"
		nmap <leader>es :UltiSnipsEdit<CR>

	Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for' : 'markdown' }

	Plug 'kassio/neoterm'
		let g:neoterm_shell = "zsh"
		let g:neoterm_default_mod="botright"
		let g:neoterm_size=15
		let g:neoterm_fixedsize = '1'
		let g:neoterm_autoscroll=1

		nmap <leader>tn :Ttoggle<CR>jk
		nmap <leader>t<CR> :T<space>
		nmap <leader>tl :<c-u>exec printf("%sTexec !! \<lt>cr>", v:count)<cr>
		nmap <leader>tk :Tkill<CR>
		nmap <leader>tq :Tclose<CR>
		nmap <leader>tc :Tclear<CR>
		nmap <leader>tp :T python %<CR>
		nmap <leader>tb :T bash %<CR>
		nmap <leader>ti <leader>j20+
		" REPL support
		nmap <leader>rl :TREPLSendLine<CR>
		vmap <leader>rs :TREPLSendSelection<CR>
		nmap <leader>rq :T exit()<CR>

	" debugger integration
	Plug 'sakhnik/nvim-gdb', {'do': ':!./install.sh \| UpdateRemotePlugins' }
		nmap <leader>dr <leader>jirun<CR>kk<leader>k
		nmap <leader>dt :GdbBreakpointToggle<CR>
		nmap <leader>dn :GdbNext<CR>
		nmap <leader>ds :GdbStep<CR>
		nmap <leader>df :GdbFinish<CR>
		nmap <leader>du :GdbUntil<CR>
		nmap <leader>dq :GdbDebugStop<CR>
		nmap <leader>dc :GdbBreakpointClearAll<CR>
		nmap <leader>dd :GdbStart gdb -q<space> 
		nmap <leader>dp :GdbStartPDB python -m pdb<space>
		nmap <leader>db :GdbStartBashDB bashdb<space>


	" c/c++ specific 
	" switch to header file
	Plug 'whz861025/a.vim', {'for' : ['c', 'cpp']}
		nmap <leader>sh :A<CR>
		nmap <leader>vh :AV<CR>

	Plug 'kana/vim-textobj-user'
	Plug 'kana/vim-textobj-indent'
	Plug 'kana/vim-textobj-line'
	Plug 'Julian/vim-textobj-variable-segment'

call plug#end()

" defx
call defx#custom#option('_', {
		\ 'columns': 'indent:icon:git:icons:filename',
		\ })

call defx#custom#option('_', {
      \ 'winwidth': 40,
      \ 'split': 'vertical',
      \ 'direction': 'topleft',
      \ 'show_ignored_files': 0,
      \ 'buffer_name': '',
      \ 'toggle': 1,
      \ 'resume': 1
      \ })

call defx#custom#column('icon', {
		\ 'directory_icon': '▸',
		\ 'opened_icon': '▾',
		\ 'root_icon': ' ',
		\ })

" floating window
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__

function! CreateCenteredFloatingWindow()
    let width = float2nr(&columns * 0.8)
    let height = float2nr(&lines * 0.8)
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    autocmd BufWipeout <buffer> call CleanupBuffer(s:buf)
endfunction

function! CleanupBuffer(buf)
    if bufexists(a:buf)
        silent execute 'bwipeout! '.a:buf
    endif
endfunction

function! DeleteUnlistedBuffers()
    for n in nvim_list_bufs()
        if ! buflisted(n)
            let name = bufname(n)
            if name == '[Scratch]' ||
              \ matchend(name, ":lazygit") ||
              \ matchend(name, ":ranger") ||
              \ matchend(name, ":tmuxinator-fzf-start.sh")
                call CleanupBuffer(n)
            endif
        endif
    endfor
endfunction

autocmd TermOpen,BufEnter term://* startinsert

function! ToggleTerm(cmd)
    if empty(bufname(a:cmd))
        call CreateCenteredFloatingWindow()
        call termopen(a:cmd, { 'on_exit': function('OnTermExit') })
    else
        call DeleteUnlistedBuffers()
    endif
endfunction

" lazygit
nnoremap <silent> <Leader>gt :call ToggleLazyGit()<CR>
function! ToggleLazyGit()
    call ToggleTerm('lazygit')
endfunction

nnoremap <silent> <Leader>rt :call ToggleRanger()<CR>
function! ToggleRanger()
    call ToggleTerm('ranger')
endfunction

function! OnTermExit(job_id, code, event) dict
    if a:code == 0
        call DeleteUnlistedBuffers()
    endif
endfunction


nmap + <C-w>+
nmap - <C-w>-
nmap <C-l> <C-w>>
nmap <C-h> <C-w><
nmap S :%s//g<left><left>
nmap <Leader>q :q<CR>
nmap <Leader>+ 20+ 
nmap <Leader>- 20- 
nmap <left> <C-w>>
nmap <right> <C-w><
nmap <silent><Leader>h <C-w>h
nmap <silent><Leader>j <C-w>j
nmap <silent><Leader>k <C-w>k
nmap <silent><Leader>l <C-w>l
nmap ; :
nmap <Leader>y "+yy
vmap <Leader>y "+y
nmap ` '
nmap <leader>qj <C-w>j:q<CR>
nmap <leader>qh <C-w>h:q<CR>
nmap <leader>qk <C-w>k:q<CR>
nmap <leader>ql <C-w>l:q<CR>
nmap <leader>tt :tabnew<CR>
nmap <leader>= <c-w>=
nmap <c-s> <c-a>
set pumblend=20


inoremap jk <Esc>`^
inoremap JK <Esc>`^
nmap "," za
nmap <leader>n :noh<CR><Esc>
nmap x "_dl
nmap <leader>so :source ~/.config/nvim/init.vim<CR>
nmap <leader>cof :e ~/.config/nvim/init.vim<CR>
nmap <leader>wo <C-w>o
nmap <leader>bc :bd<CR>
nmap <leader>w :w<CR>
nmap :: :<c-f>
nmap Y y$

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

" set terminal colors
let g:terminal_color_0  = '#333333'
let g:terminal_color_1  = '#df9a98'
let g:terminal_color_2  = '#3cc786'
let g:terminal_color_3  = '#e0bb71'
let g:terminal_color_4  = '#96bbdc'
let g:terminal_color_5  = '#dfbdbc'
let g:terminal_color_6  = '#97bcbc'
let g:terminal_color_7  = '#d8d8d8'
let g:terminal_color_8  = '#68727c'
let g:terminal_color_9  = '#e07798'
let g:terminal_color_10 = '#97bb98'
let g:terminal_color_11 = '#ffdd98'
let g:terminal_color_12 = '#badcfb'
let g:terminal_color_13 = '#ffbebc'
let g:terminal_color_14 = '#96ddde'
let g:terminal_color_15 = '#e9e9e9'

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
au BufNewFile,BufRead *.html,*.js,*.vue set tabstop=2
au BufNewFile,BufRead *.html,*.js,*.vue set softtabstop=2
au BufNewFile,BufRead *.html,*.js,*.vue set shiftwidth=2
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
let g:seoul256_background = 234
colorscheme OceanicNext
hi Folded ctermbg=240 ctermfg=250 term=NONE cterm=bold gui=bold
hi Visual ctermbg=245
hi Comment cterm=italic term=italic gui=italic
hi Terminal ctermbg=lightgrey ctermfg=blue guibg=lightgrey guifg=blue
hi Pmenu guifg=lightgrey guibg=#4e4e4e ctermbg=239 ctermfg=lightgrey
hi LineNr guifg=#71a9cc guibg=None
hi Normal guibg=NONE ctermbg=None
hi GitGutterAdd guibg=None
hi GitGutterChange guibg=None
hi GitGutterDelete guibg=None
hi GitGutterChangeDelete guibg=None
hi Directory ctermfg=red
hi DefxIconsDirectory ctermfg=115 cterm=bold gui=bold
hi EndOfBuffer guibg=None ctermbg=None
