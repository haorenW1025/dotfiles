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


" vista
nmap <silent> , :Vista!!<CR>
nmap <leader>st :Vista finder<CR>

nmap <leader>es :UltiSnipsEdit<CR>
" neoterm
nmap <leader>tn :Ttoggle<CR>jk
nmap <leader>t<CR> :T<space>
nmap <leader>tl :<c-u>exec printf("%sTexec !! \<lt>cr>", v:count)<cr>
nmap <leader>tk :Tkill<CR>
nmap <leader>tq :Tclose<CR>
nmap <leader>tc :Tclear<CR>
nmap <leader>tp :T python %<CR>
nmap <leader>tb :T bash %<CR>
nmap <leader>ti <leader>j20+
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
nmap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nmap ]e  :<c-u>execute 'move +'. v:count1<cr>
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
nmap + <C-w>+
nmap - <C-w>-
nmap <C-l> <C-w>>
nmap <C-h> <C-w><
nmap S :%s//g<left><left>
nmap <Leader>q :q<CR>
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

nmap ]b :next
nmap [b :bprevious
nmap ]q :cnext
nmap [q :cprevious


inoremap jk <Esc>`^
inoremap JK <Esc>`^
nmap "," za
nmap <leader>n :noh<CR><Esc>
nmap x "_dl
nmap <leader>so :source ~/.config/nvim/init.vim<CR>
nmap <leader>cof :e ~/.config/nvim/init.vim<CR>
nmap <leader>wo <C-w>o
nmap <leader>bc :bd<CR>
nmap <leader>w :w<CR>
nmap :: :<c-f>
nmap Y y$
