" coc config
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
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>tgd call CocAction('jumpDefinition', 'tab')
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr <Plug>(coc-references)
nmap <silent> <leader>d  :CocList diagnostics<cr>
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)
nmap <silent> <leader>/ :CocList words<cr>
nmap <leader><leader>f  <Plug>(coc-format-selected)
nmap <silent> <leader>rn :CocCommand document.renameCurrentWord
nnoremap <silent> K :call <SID>show_documentation()<CR>
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : 
                                            \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
nmap <leader>for :Format<CR>


    function! s:show_documentation()
        if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
        else
            call CocAction('doHover')
        endif
    endfunction

