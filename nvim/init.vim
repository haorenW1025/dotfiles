syntax enable
syntax on
set nocompatible
set number
call plug#begin('~/.vim/plugged') 
    let mapleader = " "
	let maplocalleader = "="
    " themes
	" Plug 'junegunn/seoul256.vim'
	" Plug 'mhartington/oceanic-next'
    Plug 'rakr/vim-one'

	Plug 'dhruvasagar/vim-table-mode'
	Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

	Plug 'junegunn/fzf.vim'
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'scrooloose/nerdcommenter'
		let g:NERDSpaceDelims = 1
		let g:NERDTrimTrailingWhitespace = 1
		let g:NERDCompactSexyComs = 1

	Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
    " Defx git
    Plug 'kristijanhusak/defx-git'
    " Defx icons
    Plug 'whz861025/defx-icons'

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
        \}

    " surround & repeat 
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-abolish'
    Plug 'tpope/vim-dispatch'

    " git wrapper
    Plug 'APZelos/blamer.nvim'
    Plug 'airblade/vim-gitgutter'
        let g:blamer_delay = 500

    Plug 'lervag/vimtex'
        let g:tex_flavor='latex'
        let g:vimtex_view_method='zathura'
        let g:vimtex_quickfix_mode=0
        set conceallevel=1
        let g:tex_conceal='abdmg'



    Plug 'dstein64/vim-startuptime'

    " language server : autocomplete, snippets support, goto action
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " ctags support : show classes, function and more
    Plug 'liuchengxu/vista.vim'
		let g:vista_default_executive = 'ctags'
        let g:vista_fzf_preview = ['right:70%']
		let g:vista_ignore_kinds = ['variable']
		let g:vista_sidebar_width = 40
        let g:vista#renderer#enable_icon = 1
		let g:vista_echo_cursor_strategy = 'floating_win'
		autocmd BufEnter * if winnr('$') == 1  && &filetype ==# 'vista' | execute "normal! :q!\<CR>" | endif

    " snippets setup
    Plug 'SirVer/ultisnips'
    Plug 'whz861025/vim-snippets'
		let g:UltiSnipsSnippetDirectories = ["~/.vim/plugged/vim-snippets/UltiSnips/"]
        let g:UltiSnipsEditSplit="vertical"
        let g:UltiSnipsExpandTrigger="<c-n>"
        let g:ultisnips_python_style="google"
		let g:UltiSnipsJumpForwardTrigger="jl"
		let g:ultisnipsjumpbackwardtrigger="jh"

    Plug 'psliwka/vim-smoothie'

	Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for' : 'markdown' }

	Plug 'kassio/neoterm'
        let g:neoterm_shell = "zsh"
        let g:neoterm_default_mod="botright"
        let g:neoterm_size=15
        let g:neoterm_fixedsize = '1'
        let g:neoterm_autoscroll=1

	" debugger integration
	Plug 'sakhnik/nvim-gdb', {'do': ':!./install.sh \| UpdateRemotePlugins' }

	" c/c++ specific 
	" switch to header file
	Plug 'whz861025/a.vim', {'for' : ['c', 'cpp']}

	Plug 'kana/vim-textobj-user'
	Plug 'kana/vim-textobj-indent'
	Plug 'kana/vim-textobj-line'
	Plug 'Julian/vim-textobj-variable-segment'

call plug#end()


for f in split(glob('~/.config/nvim/plugins/*.vim'), '\n')
    exe 'source' f
endfor
