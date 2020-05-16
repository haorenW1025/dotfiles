command! -nargs=0 RunQtConsole call jobstart("jupyter qtconsole --JupyterWidget.include_other_output=True")

function InsertCell()
    let line = line('.')
    call nvim_buf_set_lines(0, line-2, line, v:false, ['#{', '','#}'])
endfunction

nmap <silent> <leader>jqt :RunQtConsole<Enter>
nmap <silent> <leader>jk :IPython<Space>--existing<Space>--no-window<Enter>
nmap <silent> <leader>jc :call InsertCell()<CR>
nmap <silent> <leader>rc <Plug>(IPy-RunCell)
nmap <silent> <leader>ra <Plug>(IPy-RunAll)
imap <silent> jc <cmd>call InsertCell()<CR>

set foldmethod=marker

let g:ipy_celldef = ['^#{', '^#}']

set foldmarker=#{,#}

set foldlevel=99

