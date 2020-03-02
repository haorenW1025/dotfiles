" let g:seoul256_background = 234
let g:one_allow_italics = 1
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
    hi TabLineSel gui=Bold guibg=#c678dd
    hi TabLine guibg=#3e4452 guifg=#c7c7c7 gui=None
    hi TabLineFill guibg=None
endf

autocmd ColorScheme * call SelfDefinedHighlight()

colorscheme one

" set terminal colors
let g:terminal_color_0   = '#282c34'
let g:terminal_color_1   = '#ff6c6b'
let g:terminal_color_2   = '#98be65'
let g:terminal_color_3   = '#ecbe7b'
let g:terminal_color_4   = '#51afef'
let g:terminal_color_5   = '#c678dd'
let g:terminal_color_6   = '#46d9ff'
let g:terminal_color_7   = '#bbc2cf'
let g:terminal_color_8   = '#7c8f8f'
let g:terminal_color_9   = '#ff5874'
let g:terminal_color_10  = '#21c7a8'
let g:terminal_color_11  = '#ecc48d'
let g:terminal_color_12  = '#82aaff'
let g:terminal_color_13  = '#ae81ff'
let g:terminal_color_14  = '#7fdbca'
let g:terminal_color_15  = '#d6deeb'
