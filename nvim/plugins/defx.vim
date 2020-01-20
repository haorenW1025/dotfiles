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
