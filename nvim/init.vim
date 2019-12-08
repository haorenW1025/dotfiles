syntax enable
syntax on
set nocompatible
set number
call plug#begin('~/.vim/plugged') 
    let mapleader = ","
    " themes
	Plug 'dracula/vim', { 'as': 'dracula' }


    " commenter
	Plug 'scrooloose/nerdcommenter'
		let g:NERDSpaceDelims = 1
		let g:NERDTrimTrailingWhitespace = 1
		let g:NERDCompactSexyComs = 1

	Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
		nmap \ :Defx -columns=git:mark:icons:indent:filename:type -winwidth=40 -direction=topleft 
					\-split=vertical -resume=1 -toggle=1 <CR>
		nmap <leader>\ :Defx `expand('%:p:h')` -search=`expand('%:p')` -columns=git:mark:icons:indent:filename:type -winwidth=40 -direction=topleft 
					\-split=vertical -toggle=1 <CR>
		autocmd FileType defx call s:defx_my_settings()
		function! s:defx_my_settings() abort
			nnoremap <silent><buffer><expr> <CR>
				\ defx#is_directory() ?
				\ defx#do_action('open_or_close_tree') :
				\ defx#do_action('drop',)
			nmap <silent><buffer><expr> <2-LeftMouse>
				\ defx#is_directory() ?
				\ defx#do_action('open_or_close_tree') :
				\ defx#do_action('drop',)
			nnoremap <silent><buffer><expr> s defx#do_action('drop', 'split')
			nnoremap <silent><buffer><expr> v defx#do_action('drop', 'vsplit')
			nnoremap <silent><buffer><expr> t defx#do_action('drop', 'tabe')
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
			nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select')
			nnoremap <silent><buffer><expr> r defx#do_action('redraw')
			nnoremap <silent><buffer><expr> j  line('.') == line('$') ? 'gg' : 'j'
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
		Plug 'kristijanhusak/defx-icons'
		" disbale syntax highlighting to prevent performence issue
			let g:defx_icons_column_length = 2
			let g:defx_icons_enable_syntax_highlight = 1


    " syntax highlighting
	Plug 'sheerun/vim-polyglot'

	Plug 'jiangmiao/auto-pairs'

    " status line
	Plug 'itchyny/lightline.vim'
        set showtabline=2
        let g:lightline = {
            \ 'colorscheme': 'dracula',
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

    " auto align
    Plug 'junegunn/vim-easy-align'
        " how to align : gaip+what you want to align
        nmap ga <Plug>(EasyAlign)

	" different color for parentheses
    Plug 'luochen1990/rainbow' 
        let g:rainbow_active = 1
        let g:rainbow_conf = {
        \	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
        \	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
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

    " git wrapper
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
		nmap <Leader>gw :Gwrite<CR>
		nmap <Leader>gc :Gcommit<CR>
        nmap <silent> <leader>gs :Gstatus<cr>
        nmap <leader>ge :Gedit<cr>
        nmap <silent><leader>gr :Gread<cr>
        nmap <silent><leader>gb :Gblame<cr>
		nmap ]h <Plug>(GitGutterNextHunk)
		nmap [h <Plug>(GitGutterPrevHunk)
		nmap <leader>ghp <Plug>(GitGutterPreviewHunk)
		nmap <leader>ghu <Plug>(GitGutterUndoHunk)
		nmap <leader>ghs <Plug>(GitGutterStageHunk)


	Plug 'mg979/vim-visual-multi'
		nmap  <Leader>m  <Plug>(VM-Mouse-Word)  

	Plug 'liuchengxu/vim-clap'
		nmap <Leader>ff :Clap grep ++ef=fzf<CR>
		nmap <Leader>fw :Clap grep ++ef=fzf<CR><c-r>"
		nmap <Leader>fc :Clap grep ++ef=fzf ++query=<cword><CR>
		nmap <Leader>fg :Clap grep ++ef=fzf<CR>
		nmap <Leader>fb :Clap buffers ++ef=fzf<CR>
		nmap <Leader>fj :Clap jumps<CR>
		nmap <Leader>p :Clap files ++ef=fzf<CR>
		nmap <Leader>ph yi":Clap files ++ef=fzf<CR><c-r>"
		nmap <Leader>o :Clap history ++ef=fzf<CR>


	
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
        nmap <silent> gd <Plug>(coc-definition)
        nmap <silent> gy <Plug>(coc-type-definition)
        nmap <silent> gi <Plug>(coc-implementation)
        nmap <silent> gr <Plug>(coc-references)
        nmap <silent> <Leader>d  :CocList diagnostics<cr>
        nmap <silent> [d <Plug>(coc-diagnostic-prev)
        nmap <silent> ]d <Plug>(coc-diagnostic-next)
        nmap <silent> <Leader>/ :CocList words<cr>
        nmap <Leader><Leader>f  <Plug>(coc-format-selected)
		nmap <silent> <Leader>rn :CocCommand document.renameCurrentWord
        nnoremap <silent> K :call <SID>show_documentation()<CR>
        inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : 
                                                   \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

        command! -nargs=0 Format :call CocAction('format')
        command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')


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
        let g:vista_fzf_preview = ['right:30%']
		let g:vista_ignore_kinds = ['variable']
		let g:vista_sidebar_width = 40
        let g:vista#renderer#enable_icon = 1
		let g:vista_echo_cursor_strategy = 'floating_win'
        nmap <silent> ; :Vista!!<CR>
		autocmd BufEnter * if winnr("$") == 1 && vista#sidebar#IsVisible() | execute "normal! :q!\<CR>" | endif

	Plug 'tmux-plugins/vim-tmux-focus-events'
    " snippets setup
    Plug 'SirVer/ultisnips'
    Plug 'whz861025/vim-snippets'
        let g:UltiSnipsEditSplit="vertical"
        let g:UltiSnipsExpandTrigger="<c-n>"
        let g:ultisnips_python_style="google"
		let g:UltiSnipsJumpForwardTrigger="jl"
		let g:ultisnipsjumpbackwardtrigger="jh"

	Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for' : 'markdown' }

	Plug 'kassio/neoterm'
		let g:neoterm_shell = "zsh"
		let g:neoterm_default_mod="botright"
		let g:neoterm_size=15
		let g:neoterm_fixedsize = '1'
		let g:neoterm_autoscroll=1

		nmap <leader>tn :Ttoggle<CR>
		nmap <leader>t<CR> :T<space>
		nmap <leader>tl :T<UP><CR>
		nmap <leader>tk :Tkill<CR>
		nmap <leader>tq :Tclose<CR>
		nmap <leader>tc :Tclear<CR>
		nmap <leader>tp :T python %<CR>
		nmap <leader>tb :T bash %<CR>
		nmap <leader>tm :T make<CR>
		nmap <leader>ti <leader>j20+

	" bebugger integration
	Plug 'sakhnik/nvim-gdb'
    let g:nvimgdb_config = {
		\ 'key_until':      '<f4>',
		\ 'key_continue':   '<f5>',
		\ 'key_next':       '<f10>',
		\ 'key_step':       '<f11>',
		\ 'key_finish':     '<f12>',
		\ 'key_breakpoint': '<f8>',
		\ 'key_frameup':    '<c-p>',
		\ 'key_framedown':  '<c-n>',
		\ 'key_eval':       '<f9>',
		\ 'set_tkeymaps':   'function("GdbCallAsync", "keymaps.set_t")',
		\ 'set_keymaps':    'function("GdbCallAsync", "keymaps.set")',
		\ 'unset_keymaps':  'function("GdbCallAsync", "keymaps.unset")',
		\ 'sign_current_line': '▶',
		\ 'sign_breakpoint': [ '●', '●²', '●³', '●⁴', '●⁵', '●⁶', '●⁷', '●⁸', '●⁹', '●ⁿ' ],
		\ 'split_command': 'split'
		\ }

	" c/c++ specific 
	" switch to header file
	Plug 'vim-scripts/a.vim'
		nmap <leader>sh :A<CR>
		nmap <leader>vh :AV<CR>

call plug#end()

nmap + <C-w>+
nmap - <C-w>-
nmap <C-l> <C-w>>
nmap <C-h> <C-w><
nmap S :%s//g<left><left>
nmap <Leader>q :q<CR>
nmap <Leader>+ 10+ 
nmap <Leader>- 10- 
nmap <Leader>L 5<C-w>>
nmap <Leader>H 5<C-w><
nmap <silent><Leader>h <C-w>h
nmap <silent><Leader>j <C-w>j
nmap <silent><Leader>k <C-w>k
nmap <silent><Leader>l <C-w>l
nmap <Leader>y "+yy
xmap <Leader>y "+y
inoremap jk <Esc>`^
inoremap JK <Esc>`^
nmap <Space> za
nmap <leader>n :noh<CR><Esc>
nmap x "_dl
nmap <silent> j gj
nmap <silent> k gk
nmap <leader>so :source ~/.config/nvim/init.vim<CR>
nmap <leader>cof :e ~/.config/nvim/init.vim<CR>
nmap <leader>es :e ~/.vim/plugged/vim-snippets/UltiSnips/
nmap <leader>qj <C-w>j:q<CR>
nmap <leader>qh <C-w>h:q<CR>
nmap <leader>qk <C-w>k:q<CR>
nmap <leader>ql <C-w>l:q<CR>
nmap <leader>b :bd<CR>
nmap :: :<c-f>

if has("autocmd")
" Highlight TODO, FIXME, NOTE, etc.
autocmd Syntax * call matchadd('Todo', '\W\zs\(TODO\|FIXME\|CHANGED\|BUG\|HACK\)')
autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\)')
endif

" Terminal settings
highlight TermCursor ctermfg=red guifg=red

tnoremap jj <C-\><C-n>
tnoremap kk <C-\><C-n>
tnoremap <esc> <C-\><C-n>:q<CR>
tnoremap <leader>k <C-\><C-n><C-w>k

augroup neovim_terminal
	autocmd!


	" Disables number lines on terminal buffers
	autocmd TermOpen * :set nonumber norelativenumber
augroup END





" folding
set foldmethod=indent
set foldlevelstart=99
autocmd BufWrite * mkview
autocmd BufRead * silent! loadview

set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

" tab
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4 " the visible width of tabs
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftwidth=4 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'
set nowrap
set nolinebreak
set textwidth=0 
set wrapmargin=0


set noerrorbells
set visualbell
set t_vb=
set tm=500
set autoread
set backspace=indent,eol,start
set shellpipe=>
set ruler
set history=100
set shiftwidth=4
set tw=80
set wildmode=list:longest
set splitbelow splitright
set updatetime=300
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
colorscheme dracula 
hi Folded ctermbg=240 ctermfg=250 term=NONE cterm=bold
hi Visual ctermbg=245
hi Comment ctermfg=189 cterm=bolditalic term=bolditalic gui=bolditalic
hi Terminal ctermbg=lightgrey ctermfg=blue guibg=lightgrey guifg=blue
