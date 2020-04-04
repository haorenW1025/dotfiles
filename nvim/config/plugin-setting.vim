inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
luafile ~/.config/nvim/lua/callback.lua
lua require'nvim_lsp'.clangd.setup{on_attach=require'on_attach'.on_attach}
au Filetype c,cpp setl omnifunc=v:lua.vim.lsp.omnifunc
lua require'nvim_lsp'.pyls_ms.setup{on_attach=require'on_attach'.on_attach}
au Filetype python setl omnifunc=v:lua.vim.lsp.omnifunc
lua require'nvim_lsp'.rust_analyzer.setup{on_attach=require'on_attach'.on_attach}
au Filetype rust setl omnifunc=v:lua.vim.lsp.omnifunc
lua <<EOF
require'nvim_lsp'.sumneko_lua.setup{
    on_attach= require'on_attach'.on_attach;
    log_level = vim.lsp.protocol.MessageType.Error;
    settings = {
        Lua = {
            completion = {
                keywordSnippet = "Disable";
            };
            runtime = {
                version = "LuaJIT";
            };
        };
    };
EOF
au Filetype lua setl omnifunc=v:lua.vim.lsp.omnifunc
lua require'nvim_lsp'.vimls.setup{on_attach=require'on_attach'.on_attach}
au Filetype vim setl omnifunc=v:lua.vim.lsp.omnifunc

" autocmd CursorHold * lua vim.lsp.util.show_line_diagnostics()
" autocmd CursorMoved * lua vim.lsp.util.show_line_diagnostics()

set completeopt=menuone,noinsert,noselect

let g:LspDiagnosticsErrorSign = ' '
let g:LspDiagnosticsWarningSign = '⚡'
let g:LspDiagnosticsInformationSign = 'I'
let g:LspDiagnosticsHintSign = 'H'

" diagnostic-nvim
let g:diagnostic_enable_virtual_text = 0
let g:diagnostic_virtual_text_prefix = ' '
let g:diagnostic_trimmed_virtual_text = 30
let g:space_before_virtual_text = 5
let g:diagnostic_insert_delay = 1

" completion-nvim
let g:completion_enable_snippet = 'UltiSnips'
let g:completion_max_items = 10
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
let g:polyglot_disabled = ['v']

" autopair
let g:AutoPairsShortcutFastWrap="jw"

" ultisnips
let g:UltiSnipsSnippetDirectories = ["~/.vim/plugged/vim-snippets/UltiSnips/"]
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<c-n>"
let g:ultisnips_python_style="google"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" vista
let g:vista_default_executive = 'ctags'
let g:vista_fzf_preview = ['right:70%']
let g:vista_sidebar_width = 40
let g:vista#renderer#enable_icon = 1
let g:vista_echo_cursor_strategy = 'floating_win'
let g:vista_ignore_kinds = ['variable', 'unknown']
autocmd BufEnter * if winnr('$') == 1  && &filetype ==# 'vista' | execute "normal! :q!\<CR>" | endif

" blamer
let g:blamer_delay = 500

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

" FloatLf
let g:floatLf_border = 1

let g:vim_markdown_conceal = 0

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

let g:Hexokinase_highlighters = [ 'virtual' ]

