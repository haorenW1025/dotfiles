" coc config
let g:coc_global_extensions = [
\ 'coc-rls',
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
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr <Plug>(coc-references)
nmap <silent> <leader>d  :CocList diagnostics<cr>
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader><leader>f  <Plug>(coc-format-selected)
nmap <silent> <leader>rn :CocCommand document.renameCurrentWord<CR>
nnoremap <silent> K :call <SID>show_documentation()<CR>
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : 
                                            \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
nmap <leader>for :Format<CR>



function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Defx setting
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



" defx
call defx#custom#option('_', {
		\ 'columns': 'indent:icon:git:icons:filename',
		\ })

call defx#custom#option('_', {
      \ 'winwidth': 30,
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

" dispatch
let g:dispatch_no_maps = 1

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
let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }

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


" status line
set showtabline=2
let g:lightline = {
    \ 'colorscheme': 'one',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'cocstatus': 'coc#status',
    \ },
    \ }


" polyglot
" let g:polyglot_disabled = ['markdown']

" ultisnips
let g:UltiSnipsSnippetDirectories = ["~/.vim/plugged/vim-snippets/UltiSnips/"]
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<c-n>"
let g:ultisnips_python_style="google"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"

" neoterm
let g:neoterm_shell = "zsh"
let g:neoterm_default_mod="botright"
let g:neoterm_size=15
let g:neoterm_fixedsize = '1'
let g:neoterm_autoscroll=1

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

" vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

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
