syntax enable
syntax on
set nocompatible
set number
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged') 
    let mapleader = " "
    let maplocalleader = ","
    Plug 'arcticicestudio/nord-vim'

    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/fzf', { 'dir': '~/packages/fzf', 'do': './install --all' }

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
    Plug 'airblade/vim-gitgutter'

    " language server : autocomplete, snippets support, goto action, diagnostics
    Plug 'neovim/nvim-lsp'

    " snippets setup
    Plug 'SirVer/ultisnips'
    Plug 'haorenW1025/vim-snippets'

    " utility plugins
    Plug 'psliwka/vim-smoothie'
    Plug 'Yggdroot/indentLine'

    " alignment plugin
    Plug 'junegunn/vim-easy-align'

    Plug 'kana/vim-textobj-user'
	Plug 'Julian/vim-textobj-variable-segment'
    Plug 'justinmk/vim-sneak'

    Plug 'sgur/vim-editorconfig'
    " colorizer
    Plug 'norcalli/nvim-colorizer.lua'

    " tree-sitter
    Plug 'nvim-treesitter/nvim-treesitter'
    " Plug 'vigoux/completion-treesitter'
    Plug 'mfussenegger/nvim-dap'

    " My Plugins
    Plug 'hrsh7th/vim-vsnip-integ'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'haorenW1025/completion-nvim'
    Plug 'ckipp01/nvim-metals'
    " Plug 'archseer/snippets.nvim'
	Plug 'haorenW1025/term-nvim'
    Plug 'haorenW1025/floatLf-nvim'
    Plug 'haorenW1025/diagnostic-nvim'
call plug#end()

luafile ~/.config/nvim/init.lua

