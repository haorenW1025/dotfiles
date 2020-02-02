
function! CreateCenteredFloatingWindow()
    let width = float2nr(&columns * 0.9)
    let height = float2nr(&lines * 0.9)
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "┌" . repeat("─", width - 2) . "┐"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "└" . repeat("─", width - 2) . "┘"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
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
              \ matchend(name, ":zsh")
                call CleanupBuffer(n)
            endif
        endif
    endfor
endfunction


function! ToggleTerm(cmd)
    if empty(bufname(a:cmd))
        call CreateCenteredFloatingWindow()
        startinsert
        call termopen(a:cmd, { 'on_exit': function('OnTermExit') })
    else
        call DeleteUnlistedBuffers()
    endif
endfunction

" lazygit
nnoremap <silent> <Leader>tg :call ToggleLazyGit()<CR>
function! ToggleLazyGit()
    call ToggleTerm('lazygit')
endfunction

nnoremap <silent> <Leader>tt :call ToggleGotop()<CR>
function! ToggleGotop()
    call ToggleTerm('gotop')
endfunction

nnoremap <silent> <Leader>tl :call ToggleLf()<CR>
function! ToggleLf()
    call ToggleTerm('lf')
endfunction

function! ToggleZsh()
    call ToggleTerm('zsh')
endfunction

function! OnTermExit(job_id, code, event) dict
    if a:code == 0
        call DeleteUnlistedBuffers()
    endif
endfunction
