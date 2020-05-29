" call fzf#run(fzf#wrap({
  " \ 'source': luaeval('require"util".get_symbol'),
  " \ 'sink*': { lines -> s:delete_buffers(lines) },
  " \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
" \ }))
