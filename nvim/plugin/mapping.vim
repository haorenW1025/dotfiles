" lsp
nnoremap <silent> gc <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> pd    <cmd>lua require'lsp_util'.peek_definition()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> <leader>f <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> <leader>a <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> ]d :NextDiagnostic<CR>
nnoremap <silent> [d :PrevDiagnostic<CR>
nnoremap <silent> <leader>do :OpenDiagnostic<CR>
nnoremap <leader>dl <cmd>lua require'diagnostic.util'.show_line_diagnostics()<CR>

" fzf
nmap ,f :Files<CR>
nmap ,h :FZF ~<CR>
nmap ,g :GFiles<CR>
nmap ,m :History<CR>
nmap ,b :Buffer<CR>
nmap ,sn :Snippets<CR>
nmap ,c :Chistory<CR>
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
nmap ,ss :Rg<space>
nmap ,sc :Rg <c-r>=expand("<cword>")<CR><CR>
nmap ,sl :Rg<UP><CR>


" git
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
nmap <leader>ghp <Plug>(GitGutterPreviewHunk)
nmap <leader>ghu <Plug>(GitGutterUndoHunk)
nmap <leader>ghs <Plug>(GitGutterStageHunk)

nmap <leader>es :UltiSnipsEdit<CR>

" pandoc
autocmd Filetype markdown nnoremap  <leader>pdf <cmd>lua require'markdown'.convertFile()<CR>

" c, cpp
autocmd Filetype cpp nnoremap <leader>mk :Dispatch make<CR>
autocmd Filetype c nnoremap <leader>mk :Dispatch make<CR>
autocmd Filetype rust nnoremap <leader>rc :Dispatch cargo check<CR>

" tmux like terminal
tnoremap <c-a><CR> <C-\><C-n>

nmap <c-n> :tabnew term://zsh<CR>
nmap <c-a>v :vsplit term://zsh<CR>i
nmap <c-a>x :split term://zsh<CR>i
" tmap <c-n> <c-a><CR>:tabnew term://zsh<CR>i
tmap <c-a>v <c-a><CR>:vsplit term://zsh<CR>i
tmap <c-a>x <c-a><CR>:split term://zsh<CR>i
tmap <c-a>] <c-a>:+tabmove<cr>
tmap <c-a>[ <c-a>:-tabmove<cr>
tmap ˙ <c-a><CR><c-w>h
tmap ∆ <c-a><CR><c-w>j
tmap ˚ <c-a><CR><C-w>k
tmap ¬ <c-a><CR><c-w>l
tmap <c-a>J <c-a><CR><c-w>J
tmap <c-a>K <c-a><CR><c-w>K
tmap <c-a>H <c-a><CR><c-w>H
tmap <c-a>L <c-a><CR><c-w>L


function! ClosingTerminal()
    let answer = confirm('closing this terminal?', "&Yes\n&No", 1)
    if answer == 1
        bwipeout!
    endif
endfunction
nmap <c-q> :call ClosingTerminal()<CR>
tmap <c-q> <c-a><CR>:call ClosingTerminal()<CR>

function! ClosingTab()
    let answer = confirm('closing this tab?', "&Yes\n&No", 1)
    if answer == 1
        tabc
    endif
endfunction

nmap ]t gt
nmap [t gT
tmap } <c-a><CR>gt
tmap { <c-a><CR>gT
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

" term-nvim
nmap tt :TermToggle<CR>
nmap t<CR> :TermSend<Space>
nmap tl :TermSend !! <CR>
nmap tk :TermKill<CR>
nmap tc :TermSend clear<CR>
autocmd FileType python nmap <buffer> <leader>tr :TermSend python %<CR>
autocmd FileType sh nmap <buffer> <leader>tr:TermSend bash %<CR>
autocmd FileType rust nmap <buffer> <leader>tr:TermSend cargo run<CR>
autocmd FileType lua nmap <buffer> <leader>tr:TermSend lua %<CR>
" REPL support nmap <leader>rl :TREPLSendLine<CR>
" vmap <leader>rs :TREPLSendSelection<CR>
" nmap <leader>rq :T exit()<CR>

" floatLf
nmap \ :LfToggle<CR>
nmap <leader>\ :LfToggleCurrentBuf<CR>
let g:floatLf_lf_close = '\'

" fold
nmap <leader><leader> za

" leetcode cli
nmap <localleader>lt :T leetcode test %<CR>
nmap <localleader>ls :T leetcode submit %<CR>

nmap <leader>cd :cd %:p:h<CR>
nmap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nmap ]e  :<c-u>execute 'move +'. v:count1<cr>
nmap + <C-w>+
nmap - <C-w>-
nmap S :%s//g<left><left>
nmap <Leader>+ 20+ 
nmap <Leader>- 20- 
nmap <left> <C-w>>
nmap <right> <C-w><
nmap <silent>˙ <C-w>h
nmap <silent>∆ <C-w>j
nmap <silent>˚ <C-w>k
nmap <silent>¬ <C-w>l
nmap <Leader>y "+yy
vmap <Leader>y "+y
nmap <leader>qj <C-w>j:q<CR>
nmap <leader>qh <C-w>h:q<CR>
nmap <leader>qk <C-w>k:q<CR>
nmap <leader>ql <C-w>l:q<CR>
nmap <leader>= <c-w>=
noremap ' ;
noremap ; :


nmap ]b :bnext<CR>
nmap [b :bprevious<CR>
nmap ]q :cnext<CR>
nmap [q :cprevious<CR>
nmap <leader>qq :ccl<CR>
nmap <leader>qo :copen<CR>


inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
inoremap jk <Esc>`^
inoremap JK <Esc>`^
nmap <leader>n :noh<CR><Esc>
nmap x "_dl
nmap <leader>so :source ~/.config/nvim/init.vim<CR>
nmap <leader>cof :e ~/.config/nvim/init.vim<CR>
nmap <leader>wo <C-w>o
nmap <leader>bc :bd<CR>
nmap <leader>w :w<CR>
nmap :: :<c-f>
nmap Y y$

