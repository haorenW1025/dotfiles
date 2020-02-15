syntax enable
syntax on
set nocompatible
set number
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $HOME/.config/nvim/init.vim
endif

call plug#begin('~/.vim/plugged') 
    let mapleader = " "
    let maplocalleader = ","
    " themes
	" Plug 'junegunn/seoul256.vim'
	" Plug 'mhartington/oceanic-next'
    Plug 'rakr/vim-one'

	Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

	Plug 'junegunn/fzf.vim'
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

	Plug 'scrooloose/nerdcommenter'
		let g:NERDSpaceDelims = 1
		let g:NERDTrimTrailingWhitespace = 1
		let g:NERDCompactSexyComs = 1

    " Defx
	Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'kristijanhusak/defx-git'
    Plug 'whz861025/defx-icons'

    " syntax highlighting
	Plug 'sheerun/vim-polyglot'

	Plug 'jiangmiao/auto-pairs'
		let g:AutoPairsShortcutFastWrap="jw"

    " status line
	Plug 'itchyny/lightline.vim'

	" different color for parentheses
    Plug 'luochen1990/rainbow' 

    " surround & repeat 
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-abolish'
    Plug 'tpope/vim-dispatch'
    Plug 'tpope/vim-speeddating', {'for': 'org'}

    " git wrapper
    Plug 'APZelos/blamer.nvim'
    Plug 'airblade/vim-gitgutter'

    Plug 'lervag/vimtex', {'for' : 'tex'}

    " language server : autocomplete, snippets support, goto action
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " ctags support : show classes, function and more
    Plug 'liuchengxu/vista.vim'

    " snippets setup
    Plug 'SirVer/ultisnips'
    Plug 'whz861025/vim-snippets'

	Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for' : 'markdown' }

	Plug 'kassio/neoterm'

	" debugger integration
	Plug 'sakhnik/nvim-gdb', {'do': ':!./install.sh \| UpdateRemotePlugins', 'for': ['python', 'cpp', 'sh', 'c'] }

    Plug 'psliwka/vim-smoothie'
        let g:smoothie_base_speed = 20

    Plug 'godlygeek/tabular'

    Plug 'mhinz/vim-startify'

    Plug 'jceb/vim-orgmode', {'for' : 'org'}

	Plug 'kana/vim-textobj-user'
	Plug 'kana/vim-textobj-indent'
	Plug 'kana/vim-textobj-line'
	Plug 'Julian/vim-textobj-variable-segment'

    Plug 'rizzatti/dash.vim'

call plug#end()


for f in split(glob('~/.config/nvim/config/*.vim'), '\n')
    exe 'source' f
endfor
