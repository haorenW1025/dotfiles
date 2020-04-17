syntax enable
syntax on
set nocompatible
set number
call plug#begin('~/.vim/plugged') 
    let mapleader = " "
    let maplocalleader = ","
    " themes
	" Plug 'junegunn/seoul256.vim'
	" Plug 'mhartington/oceanic-next'
	" Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'arcticicestudio/nord-vim'

    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

	Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

    Plug 'scrooloose/nerdcommenter'

    " syntax highlighting
    Plug 'sheerun/vim-polyglot'

	Plug 'jiangmiao/auto-pairs'

	" different color for parentheses
    Plug 'luochen1990/rainbow' 

    " surround & repeat 
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-obsession'

    " git wrapper
    Plug 'APZelos/blamer.nvim'
    Plug 'airblade/vim-gitgutter'

    " language server : autocomplete, snippets support, goto action, diagnostics
    Plug 'neovim/nvim-lsp'

    " ctags support : show classes, function and more
    Plug 'liuchengxu/vista.vim'

    " snippets setup
    Plug 'SirVer/ultisnips'
    Plug 'haorenW1025/vim-snippets'

    Plug 'psliwka/vim-smoothie'

    Plug 'Yggdroot/indentLine'

    " alignment plugin
    Plug 'junegunn/vim-easy-align'

    Plug 'kana/vim-textobj-user'
	Plug 'Julian/vim-textobj-variable-segment'
    Plug 'jeetsukumaran/vim-indentwise'

    Plug 'unblevable/quick-scope'
    Plug 'machakann/vim-swap'

    " colorizer
    Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

    " My Plugins
    Plug 'haorenW1025/completion-nvim'
    Plug 'vigoux/completion-treesitter'
	Plug 'haorenW1025/term-nvim'
    Plug 'haorenW1025/floatLf-nvim'
    Plug 'haorenW1025/diagnostic-nvim'
call plug#end()

for f in split(glob('~/.config/nvim/config/*.vim'), '\n')
    exe 'source' f
endfor

