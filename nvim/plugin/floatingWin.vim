
function! CreateCenteredFloatingWindow(border)
    let width = float2nr(&columns * 0.9)
    let height = float2nr(&lines * 0.9)
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "╔" . repeat("═", width - 2) . "╗"
    let mid = "║" . repeat(" ", width - 2) . "║"
    let bot = "╚" . repeat("═", width - 2) . "╝"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    if a:border == 0
        call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
        call nvim_open_win(s:buf, v:true, opts)
        set winhl=Normal:Floating
    endif
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    set winhl=Normal:Floating
    autocmd BufWipeout <buffer> call CleanupBuffer(s:buf)
endfunction

function! CleanupBuffer(buf)
    if bufexists(a:buf)
        silent execute 'bwipeout! '.a:buf
    endif
endfunction

function! DeleteUnlistedBuffers()
    for n in nvim_list_bufs()
        if ! buflisted(n)
            let name = bufname(n)
            if name == '[Scratch]' ||
              \ matchend(name, ":lazygit") ||
              \ matchend(name, ":lf") ||
              \ matchend(name, ":zsh") ||
              \ matchend(name, ":gotop")
                call CleanupBuffer(n)
            endif
        endif
    endfor
endfunction


function! ToggleBorderTerm(cmd)
    if empty(bufname(a:cmd))
        call CreateCenteredFloatingWindow(0)
        startinsert
        call termopen(a:cmd, { 'on_exit': function('OnTermExit') })
    else
        call DeleteUnlistedBuffers()
    endif
endfunction

function! ToggleNoBorderTerm(cmd)
    if empty(bufname(a:cmd))
        call CreateCenteredFloatingWindow(1)
        startinsert
        call termopen(a:cmd, { 'on_exit': function('OnTermExit')})
    else
        call DeleteUnlistedBuffers()
    endif
endfunction

" lazygit
nnoremap <silent> <leader>tg :call ToggleLazyGit()<CR>
function! ToggleLazyGit()
    call ToggleNoBorderTerm('lazygit')
endfunction

nnoremap <silent> <leader>tc :call ToggleCalcurse()<CR>
function! ToggleCalcurse()
    call ToggleBorderTerm('calcurse')
endfunction

nnoremap <silent> <Leader>tt :call ToggleGotop()<CR>
function! ToggleGotop()
    call ToggleNoBorderTerm('gotop')
endfunction

nnoremap <silent> <leader>tf :call ToggleLf()<CR>
nnoremap <silent> <leader>cf :call ToggleLfCurrentFile()<CR>

function! ToggleLfCurrentFile()
    call ToggleNoBorderTerm('cd '.expand('%:p:h').' && lf')
endfunction

function! ToggleLf()
    call ToggleNoBorderTerm('lf')
endfunction

nnoremap <silent> <Leader>ts :call ToggleZsh()<CR>
function! ToggleZsh()
    call ToggleBorderTerm('zsh')
endfunction

function! OnTermExit(job_id, code, event) dict
    if a:code == 0
        call DeleteUnlistedBuffers()
    endif
endfunction

function! RefocusFloatingWin()
    wincmd p
    startinsert
endfunction
