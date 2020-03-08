inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
let g:asyncomplete_auto_popup = 1
lua require'nvim_lsp'.ccls.setup{on_attach=require'diagnostic'.on_attach}
au Filetype c,cpp setl omnifunc=v:lua.vim.lsp.omnifunc
lua require'nvim_lsp'.pyls_ms.setup{on_attach=require'diagnostic'.on_attach}
au Filetype python setl omnifunc=v:lua.vim.lsp.omnifunc
lua require'nvim_lsp'.rust_analyzer.setup{on_attach=require'diagnostic'.on_attach}
au Filetype rust setl omnifunc=v:lua.vim.lsp.omnifunc
lua <<EOF
require'nvim_lsp'.sumneko_lua.setup{
    on_attach=require'diagnostic'.on_attach;
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
}
EOF
au Filetype lua setl omnifunc=v:lua.vim.lsp.omnifunc
lua require'nvim_lsp'.vimls.setup{on_attach=require'diagnostic'.on_attach}
au Filetype vim setl omnifunc=v:lua.vim.lsp.omnifunc

" autocmd CursorHold * lua vim.lsp.util.show_line_diagnostics()
" autocmd CursorMoved * lua vim.lsp.util.show_line_diagnostics()

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
    \   'name': 'omni',
    \ 'whitelist': ['*'],
    \ 'blacklist': ['c', 'cpp', 'html'],
    \   'completor': function('asyncomplete#sources#omni#completor'),
    \ }))

" call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
    " \ 'name': 'ultisnips',
    " \ 'whitelist': ['*'],
    " \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
    " \ }))

" let g:asyncomplete_auto_completeopt=0
set completeopt=menuone,noinsert,noselect


" ALE
" let g:ale_sign_column_always = 1
" let g:ale_sign_error = '✗'
" let g:ale_sign_warning = '⚡'
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

" firenvim 
" let fc['.*'] = { 'cmdline' : 'firenvim' }
au BufEnter www.*.txt colorscheme one
au BufEnter www.firecode.*.txt set filetype=cpp
            \ | colorscheme one
if exists('g:started_by_firenvim') && g:started_by_firenvim
    " general options
    set laststatus=0
endif
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

" startify
let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   Most Recently Use']            },
        \ { 'type': 'dir',       'header': ['   Most Recently Use in '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]
let g:startify_files_number = 5
let g:startify_change_to_vcs_root = 1
let g:startify_padding_left = 5
let g:startify_session_autoload = 1


let g:ascii = [
\ 'MMMMMMMM               MMMMMMMMYYYYYYY       YYYYYYYVVVVVVVV           VVVVVVVVIIIIIIIIIIMMMMMMMM               MMMMMMMM',
\ 'M:::::::M             M:::::::MY:::::Y       Y:::::YV::::::V           V::::::VI::::::::IM:::::::M             M:::::::M',
\ 'M::::::::M           M::::::::MY:::::Y       Y:::::YV::::::V           V::::::VI::::::::IM::::::::M           M::::::::M',
\ 'M:::::::::M         M:::::::::MY::::::Y     Y::::::YV::::::V           V::::::VII::::::IIM:::::::::M         M:::::::::M',
\ 'M::::::::::M       M::::::::::MYYY:::::Y   Y:::::YYY V:::::V           V:::::V   I::::I  M::::::::::M       M::::::::::M',
\ 'M:::::::::::M     M:::::::::::M   Y:::::Y Y:::::Y     V:::::V         V:::::V    I::::I  M:::::::::::M     M:::::::::::M',
\ 'M:::::::M::::M   M::::M:::::::M    Y:::::Y:::::Y       V:::::V       V:::::V     I::::I  M:::::::M::::M   M::::M:::::::M',
\ 'M::::::M M::::M M::::M M::::::M     Y:::::::::Y         V:::::V     V:::::V      I::::I  M::::::M M::::M M::::M M::::::M',
\ 'M::::::M  M::::M::::M  M::::::M      Y:::::::Y           V:::::V   V:::::V       I::::I  M::::::M  M::::M::::M  M::::::M',
\ 'M::::::M   M:::::::M   M::::::M       Y:::::Y             V:::::V V:::::V        I::::I  M::::::M   M:::::::M   M::::::M',
\ 'M::::::M    M:::::M    M::::::M       Y:::::Y              V:::::V:::::V         I::::I  M::::::M    M:::::M    M::::::M',
\ 'M::::::M     MMMMM     M::::::M       Y:::::Y               V:::::::::V          I::::I  M::::::M     MMMMM     M::::::M',
\ 'M::::::M               M::::::M       Y:::::Y                V:::::::V         II::::::IIM::::::M               M::::::M',
\ 'M::::::M               M::::::M    YYYY:::::YYYY              V:::::V          I::::::::IM::::::M               M::::::M',
\ 'M::::::M               M::::::M    Y:::::::::::Y               V:::V           I::::::::IM::::::M               M::::::M',
\ 'MMMMMMMM               MMMMMMMM    YYYYYYYYYYYYY                VVV            IIIIIIIIIIMMMMMMMM               MMMMMMMM',
\ '', 
\ '',
\]
let g:startify_custom_header = 'startify#center(g:ascii)'

if filereadable(expand('~/.cache/startify_bookmarks'))
    source ~/.cache/startify_bookmarks
endif

" NerdCommentor
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 0
let g:NERDCompactSexyComs = 1

" polyglot
" let g:polyglot_disabled = ['markdown']

" autopair
let g:AutoPairsShortcutFastWrap="jw"

" Smoothie
let g:smoothie_base_speed = 20

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
  let g:vista_executive_for = {
      \ 'rust': 'coc',
      \ }
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

" colorizer
" lua require'colorizer'.setup()

" lens
let g:lens#height_resize_max = 40
let g:lens#height_resize_min = 10
let g:lens#width_resize_max = 80
let g:lens#width_resize_min = 20

