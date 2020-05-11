inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
luafile ~/.config/nvim/lua/callback.lua
au Filetype c,cpp setl omnifunc=v:lua.vim.lsp.omnifunc
au Filetype python setl omnifunc=v:lua.vim.lsp.omnifunc
au Filetype rust setl omnifunc=v:lua.vim.lsp.omnifunc
au Filetype lua setl omnifunc=v:lua.vim.lsp.omnifunc
au Filetype vim setl omnifunc=v:lua.vim.lsp.omnifunc

let g:completion_chain_complete_list = {
            \ 'default' : {
            \   'default': [
            \       {'complete_items': ['lsp', 'snippet', 'ts']},
            \       {'mode': '<c-p>'},
            \       {'mode': '<c-n>'}],
            \   'comment': [],
            \   'string' : [
            \       {'complete_items': ['path']}]
            \   },
            \ 'cpp' : {
            \   'default': [
            \       {'complete_items': ['lsp', 'snippet', 'ts']},
            \       {'mode': '<c-p>'},
            \       {'mode': '<c-n>'}],
            \   'comment': [],
            \   'string' : [
            \       {'complete_items': ['path']}]
            \   },
            \ 'markdown' : {
            \   'default': [
            \       {'mode': 'spel'}],
            \   'comment': [],
            \   },
            \ 'verilog' : {
            \   'default': [
            \       {'complete_items': ['ts']},
            \       {'mode': '<c-p>'},
            \       {'mode': '<c-n>'}],
            \   'comment': [],
            \   }
            \}
" autocmd CursorHold * lua vim.lsp.util.show_line_diagnostics()
" autocmd CursorMoved * lua vim.lsp.util.show_line_diagnostics()

set completeopt=menuone,noinsert,noselect

let g:LspDiagnosticsErrorSign = ' '
let g:LspDiagnosticsWarningSign = '⚡'
let g:LspDiagnosticsInformationSign = 'I'
let g:LspDiagnosticsHintSign = 'H'

" diagnostic-nvim
let g:diagnostic_level = 'Warning'
let g:diagnostic_enable_virtual_text = 0
let g:diagnostic_virtual_text_prefix = ' '
let g:diagnostic_trimmed_virtual_text = 0
let g:diagnostic_insert_delay = 1

" completion-nvim
let g:completion_auto_change_source = 1
" let g:completion_enable_snippet = 'UltiSnips'
" let g:completion_max_items = 10
let g:completion_enable_auto_paren = 1
let g:completion_timer_cycle = 200
let g:completion_auto_change_source = 1
imap <c-j> <cmd>lua require'source'.prevCompletion()<CR>
imap <c-k> <cmd>lua require'source'.nextCompletion()<CR>

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ completion#trigger_completion()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" treesitter-nvim
set foldexpr=completion_treesitter#foldexpr()
set foldmethod=expr

" firenvim 
" let fc['.*'] = { 'cmdline' : 'firenvim' }
au BufEnter www.firecode.*.txt set filetype=cpp
au BufEnter github.com_*.txt set filetype=markdown
if exists('g:started_by_firenvim') && g:started_by_firenvim
    " general options
    setl laststatus=0
    setl showtabline=0
    colorscheme nord
endif
function! s:IsFirenvimActive(event) abort
  if !exists('*nvim_get_chan_info')
    return 0
  endif
  let l:ui = nvim_get_chan_info(a:event.chan)
  return has_key(l:ui, 'client') && has_key(l:ui.client, "name") &&
      \ l:ui.client.name is# "Firenvim"
endfunction

function! OnUIEnter(event) abort
  if s:IsFirenvimActive(a:event)
    set laststatus=0
  endif
endfunction
autocmd UIEnter * call OnUIEnter(deepcopy(v:event))
nnoremap <Esc><Esc> :call firenvim#focus_page()<CR>
nnoremap <C-z> :call firenvim#hide_frame()<CR>

" fzf
let g:fzf_colors =
\ { 'fg':      ['bg', 'Normal'],
\ 'bg':      ['bg', 'Normal'],
\ 'hl':      ['fg', 'Comment'],
\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
\ 'bg+':     ['fg', 'CursorLine', 'CursorColumn'],
\ 'hl+':     ['fg', 'Statement'],
\ 'info':    ['fg', 'PreProc'],
\ 'border':  ['fg', 'Ignore'],
\ 'prompt':  ['fg', 'Conditional'],
\ 'pointer': ['fg', 'Exception'],
\ 'marker':  ['fg', 'Keyword'],
\ 'spinner': ['fg', 'Label'],
\ 'header':  ['fg', 'Comment']}

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview('right:70%'), <bang>0)

command! -bang -nargs=? -complete=dir GFiles
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview('right:70%'), <bang>0)

command! -bang -nargs=? -complete=dir History
    \ call fzf#vim#history(fzf#vim#with_preview('right:70%'), <bang>0)

command! -bang -nargs=? -complete=dir Chistory
    \ call fzf#vim#command_history()

command! -bang -nargs=* Rg
\ call fzf#vim#grep(
\   'rg --max-columns=80 --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 2,
\   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:60%'),  <bang>0)

let $FZF_DEFAULT_OPTS = "--layout=reverse"
'
let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow(0)' }

" NerdCommentor
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 0
let g:NERDCompactSexyComs = 1

" polyglot
let g:polyglot_disabled = ['v', 'vlang']

" autopair
let g:AutoPairsShortcutFastWrap="jw"

" ultisnips
let g:UltiSnipsSnippetDirectories = ["~/.vim/plugged/vim-snippets/UltiSnips/"]
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="jl"
let g:ultisnips_python_style="google"
let g:UltiSnipsJumpForwardTrigger="jl"
let g:UltiSnipsJumpBackwardTrigger="jh"

" rainbow
let g:rainbow_active = 1
let g:rainbow_conf = {
\	'guifgs': ['white', 'lightcyan', 'lightred', 'red', 'blue', 'darkgray'],
\	'ctermfgs': ['white', 'yellow', 'lightcyan', 'red', 'blue', 'darkgray'],
\	'guis': [''],
\	'cterms': [''],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\}

" editor config
let g:editorconfig_blacklist = {
    \ 'filetype': ['git.*', 'fugitive'],
    \ 'pattern': ['\.un~$']}
" easy align
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" FloatLf
let g:floatLf_border = 0
let g:floatLf_exec = 'lf'

let g:vim_markdown_conceal = 0

" sneak
let g:sneak#s_next = 1
highlight Sneak guifg=black guibg=#81A1C1 ctermfg=black ctermbg=red
highlight SneakScope guifg=red guibg=green ctermfg=red ctermbg=yellow

command! -nargs=0 RunQtConsole call jobstart("jupyter qtconsole --JupyterWidget.include_other_output=True")
let g:ipy_celldef = '^##' " regex for cell start and end

nmap <silent> <leader>jqt :RunQtConsole<Enter>
let g:ipy_celldef = '^##' " regex for cell start and end
nmap <silent> <leader>jk :IPython<Space>--existing<Space>--no-window<Enter>
nmap <silent> <leader>jc <Plug>(IPy-RunCell)
nmap <silent> <leader>ja <Plug>(IPy-RunAll)


lua require'colorizer'.setup()

au BufNewFile,BufRead *.v,*.vh,*.sv,*.svh,*.vs	set filetype=verilog
