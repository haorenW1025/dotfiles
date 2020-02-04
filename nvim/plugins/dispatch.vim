let g:dispatch_no_maps = 1
" pandoc
autocmd Filetype markdown nnoremap  <leader>pdf :Dispatch! pandoc -s -o %<.pdf % --from markdown 
            \ --template eisvogel --listings --number-sections --toc<CR>
autocmd Filetype markdown nnoremap  <leader>bmr :Dispatch! pandoc -t beamer --pdf-engine=xelatex -o %<.pdf % <CR>

" c, cpp
autocmd Filetype cpp nnoremap <leader>mk :Dispatch make<CR>
autocmd Filetype c nnoremap <leader>mk :Dispatch make<CR>

autocmd Filetype rust nnoremap <leader>rc :Dispatch cargo check<CR>
