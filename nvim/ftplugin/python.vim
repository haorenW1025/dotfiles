command! -nargs=0 RunQtConsole call jobstart("jupyter qtconsole --JupyterWidget.include_other_output=True")

nmap <silent> <leader>jqt :RunQtConsole<Enter>
nmap <silent> <leader>jk :IPython<Space>--existing<Space>--no-window<Enter>
nmap <silent> <leader>jc <cmd>lua require'python'.insertCell()<CR>
nmap <silent> <leader>rc <Plug>(IPy-RunCell)
nmap <silent> <leader>ra <Plug>(IPy-RunAll)
imap <silent> jc <cmd>lua require'python'.insertCell()<CR>
nmap <silent> ]c <cmd>lua require'python'.findNextCell()<CR>
nmap <silent> [c <cmd>lua require'python'.findPrevCell()<CR>

set foldmethod=marker

let g:ipy_celldef = ['^#{', '^#}']

set foldmarker=#{,#}

set foldlevel=99

