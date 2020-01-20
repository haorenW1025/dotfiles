
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

let $FZF_DEFAULT_OPTS = "--layout=reverse --color fg:230,bg:238,hl:65,fg+:15,bg+:234,hl+:108 --color info:108,prompt:109,spinner:108,pointer:168,marker:168"
'
let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }

function! Bufs()
    redir => list
    silent ls
    redir END
    return split(list, "\n")
endfunction

command! BD call fzf#run(fzf#wrap({
\ 'source': Bufs(),
\ 'sink*': { lines -> execute('bwipeout '.join(map(lines, {_, line -> split(line)[0]}))) },
\ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

