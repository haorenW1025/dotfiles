" let g:seoul256_background = 234
" let g:one_allow_italics = 1
set background=dark

function! SelfDefinedHighlight() abort
    " code
    hi Folded ctermbg=240 ctermfg=250 term=NONE cterm=bold gui=bold
    hi Visual ctermbg=245
    hi Comment cterm=italic term=italic gui=italic
    hi Terminal ctermbg=lightgrey ctermfg=blue guibg=lightgrey guifg=lightgrey
    hi TermCursor guifg=lightgrey
    hi TermCursorNC guifg=lightgrey
    hi NormalNC guifg=lightgrey
    hi Pmenu guifg=lightgrey guibg=#4e4e4e ctermbg=239 ctermfg=lightgrey
    hi Todo ctermfg=176 ctermbg=16 guifg=#00d6f2 guibg=None gui=bold
    " hi LineNr guifg=#696969 guibg=None
    hi CursorColumn guibg=#495663
    hi Normal guibg=NONE ctermbg=None
    hi Floating guifg=#abb2bf guibg=#292929
    hi GitGutterAdd guibg=None
    hi GitGutterChange guibg=None
    hi GitGutterDelete guibg=None
    hi GitGutterChangeDelete guibg=None
    hi Directory ctermfg=red
    hi DefxIconsDirectory ctermfg=115 cterm=bold gui=bold
    hi EndOfBuffer guibg=None ctermbg=None
    hi StartifyHeader guifg=#3cb371
    hi Todo guifg=#00d6f2 guibg=None
    hi LspDiagnosticsError guifg=#ff6c6b
    hi LspDiagnosticsWarning guifg=#FF8C00
endf

autocmd ColorScheme * call SelfDefinedHighlight()

colorscheme dracula

" set terminal colors
let g:terminal_color_0   = '#000000'
let g:terminal_color_1   = '#ff5555'
let g:terminal_color_2   = '#50fa7b'
let g:terminal_color_3   = '#f1fa8c'
let g:terminal_color_4   = '#bd93f9'
let g:terminal_color_5   = '#ff79c6'
let g:terminal_color_6   = '#8be9fd'
let g:terminal_color_7   = '#bfbfbf'
let g:terminal_color_8   = '#4d4d4d'
let g:terminal_color_9   = '#ff6e67'
let g:terminal_color_10  = '#5af78e'
let g:terminal_color_11  = '#f4f99d'
let g:terminal_color_12  = '#caa9fa'
let g:terminal_color_13  = '#ff92d0'
let g:terminal_color_14  = '#9aedfe'
let g:terminal_color_15  = '#e6e6e6'

