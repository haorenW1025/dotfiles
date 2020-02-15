" fzf
nmap <leader>ff :Files<CR>
nmap <leader>fg :GFiles<CR>
nmap <leader>fm :History<CR>
nmap <leader>fb :Buffer<CR>
nmap <leader>sn :Snippets<CR>
nmap <leader>ch :Chistory<CR>
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
nmap <leader>ss :Rg<CR>
nmap <leader>sc :Rg <c-r>=expand("<cword>")<CR><CR>

" defx
nmap \ :Defx<CR>
nmap <leader>\ :Defx `expand('%:p:h')` -search=`expand('%:p')`<CR>

" git
nmap <Leader>bt :BlamerToggle<CR>
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
nmap <leader>ghp <Plug>(GitGutterPreviewHunk)
nmap <leader>ghu <Plug>(GitGutterUndoHunk)
nmap <leader>ghs <Plug>(GitGutterStageHunk)

" tabular
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
nmap <Leader>a<bar> :Tabularize /<bar><CR>
vmap <Leader>a<bar> :Tabularize /<bar><CR>


" vista
nmap <silent> <leader>v :Vista!!<CR>
nmap <leader>st :Vista finder<CR>

nmap <leader>es :UltiSnipsEdit<CR>

" Dispatch
" pandoc
autocmd Filetype markdown nnoremap  <leader>pdf :Dispatch pandoc -s -o %<.pdf % --pdf-engine=xelatex
            \ --template eisvogel --listings --toc --number-sections<CR>
autocmd Filetype markdown nnoremap  <leader>bmr :Dispatch pandoc -t beamer --pdf-engine=xelatex -o %<.pdf % <CR>

" c, cpp
autocmd Filetype cpp nnoremap <leader>mk :Dispatch make<CR>
autocmd Filetype c nnoremap <leader>mk :Dispatch make<CR>
autocmd Filetype rust nnoremap <leader>rc :Dispatch cargo check<CR>

" tmux like terminal
tnoremap <c-a><CR> <C-\><C-n>

nmap <c-a>c :tabnew term://zsh<CR>i
nmap <c-a>_ :vsplit term://zsh<CR>i
nmap <c-a>- :split term://zsh<CR>i
tmap <c-a>c <c-a><CR>:tabnew term://zsh<CR>i
tmap <c-a>_ <c-a><CR>:vsplit term://zsh<CR>i
tmap <c-a>- <c-a><CR>:split term://zsh<CR>i
nmap <c-a>] :+tabmove<cr>
nmap <c-a>[ :-tabmove<cr>
tmap <c-a>] <c-a><CR>:+tabmove<cr>i
tmap <c-a>[ <c-a><CR>:-tabmove<cr>i
tmap <c-a>j <c-a><CR><c-w>ji
tmap <c-a>k <c-a><CR><c-w>ki
tmap <c-a>h <c-a><CR><c-w>hi
tmap <c-a>l <c-a><CR><c-w>li
tmap <c-a>J <c-a><CR><c-w>Ji
tmap <c-a>K <c-a><CR><c-w>Ki
tmap <c-a>H <c-a><CR><c-w>Hi
tmap <c-a>L <c-a><CR><c-w>Li

nmap <c-a>L :+tabmove<cr>
nmap <c-a>H :-tabmove<cr>
tmap <c-a>] <c-a><CR>:+tabmove<cr>
tmap <c-a>[ <c-a><CR>:-tabmove<cr>

function! ClosingTerminal()
    let answer = confirm('closing this terminal?', "&Yes\n&No", 1)
    if answer == 1
        bwipeout!
    endif
endfunction
nmap <c-a>q :call ClosingTerminal()<CR>
tmap <c-a>q <c-a><CR>:call ClosingTerminal()<CR>

function! ClosingTab()
    let answer = confirm('closing this tab?', "&Yes\n&No", 1)
    if answer == 1
        tabc
    endif
endfunction
nmap <c-a>x :call ClosingTab()<CR>
tmap <c-a>x <c-a><CR>:call ClosingTab()<CR>

nmap <c-a>1 1gt
tmap <c-a>1 <c-a><CR>1gt
nmap <c-a>2 2gt
tmap <c-a>2 <c-a><CR>2gt
nmap <c-a>3 3gt
tmap <c-a>3 <c-a><CR>3gt
nmap <c-a>4 4gt
tmap <c-a>4 <c-a><CR>4gt
nmap <c-a>5 5gt
tmap <c-a>5 <c-a><CR>5gt

" neoterm
nmap <leader>tn :Ttoggle<CR>jk
nmap <leader>t<CR> :Topen<CR>:T<space>
nmap <leader>tl :<c-u>exec printf("%sTexec !! \<lt>cr>", v:count)<cr>
nmap <leader>tk :Tkill<CR>
nmap <leader>tq :Tclose<CR>
nmap <leader>tc :Tclear<CR>
nmap <leader>ti <leader>j20+
autocmd FileType python nmap <buffer> <leader>tr :Topen<CR>:T python %<CR>
autocmd FileType sh nmap <buffer> <leader>tr :Topen<CR>:T bash %<CR>
autocmd FileType rust nmap <buffer> <leader>tr :Topen<CR>:T cargo run<CR>
autocmd FileType lua nmap <buffer> <leader>tr :Topen<CR>:T lua %<CR>
" REPL support 
nmap <leader>rl :TREPLSendLine<CR>
vmap <leader>rs :TREPLSendSelection<CR>
nmap <leader>rq :T exit()<CR>

" gdb
nmap <leader>dr <leader>jirun<CR>kk<leader>k
nmap <leader>dt :GdbBreakpointToggle<CR>
nmap <leader>dn :GdbNext<CR>
nmap <leader>ds :GdbStep<CR>
nmap <leader>df :GdbFinish<CR>
nmap <leader>du :GdbUntil<CR>
nmap <leader>dq :GdbDebugStop<CR>
nmap <leader>dc :GdbBreakpointClearAll<CR>
nmap <leader>dd :GdbStart gdb -q<space> 
nmap <leader>dp :GdbStartPDB python -m pdb<space>
nmap <leader>db :GdbStartBashDB bashdb<space>

" leetcode cli
nmap <localleader>lt :T leetcode test %<CR>
nmap <localleader>ls :T leetcode submit %<CR>
nmap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nmap ]e  :<c-u>execute 'move +'. v:count1<cr>
nmap + <C-w>+
nmap - <C-w>-
nmap S :%s//g<left><left>
nmap <Leader>+ 20+ 
nmap <Leader>- 20- 
nmap <left> <C-w>>
nmap <right> <C-w><
nmap <silent><Leader>h <C-w>h
nmap <silent><Leader>j <C-w>j
nmap <silent><Leader>k <C-w>k
nmap <silent><Leader>l <C-w>l
nmap ; :
nmap <Leader>y "+yy
vmap <Leader>y "+y
nmap ` '
nmap <leader>qj <C-w>j:q<CR>
nmap <leader>qh <C-w>h:q<CR>
nmap <leader>qk <C-w>k:q<CR>
nmap <leader>ql <C-w>l:q<CR>
nmap <leader>= <c-w>=
nmap <c-s> <c-a>

nmap ]b :bnext<CR>
nmap [b :bprevious<CR>
nmap ]q :cnext<CR>
nmap [q :cprevious<CR>


inoremap jk <Esc>`^
inoremap JK <Esc>`^
nmap <leader>n :noh<CR><Esc>
nmap x "_dl
nmap <leader>so :source ~/.config/nvim/init.vim<CR>
nmap <leader>cof :e ~/.config/nvim/init.vim<CR>
nmap <leader>et :e ~/org/todo.org<CR>
nmap <leader>wo <C-w>o
nmap <leader>bc :bd<CR>
nmap <leader>w :w<CR>
nmap :: :<c-f>
nmap Y y$
