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
    hi Pmenu guibg=#404040 ctermbg=239
    hi Todo ctermfg=176 ctermbg=16 guifg=#00d6f2 guibg=None gui=bold
    hi LineNr guifg=#696969 guibg=None
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
    hi ColorColumn guibg=None guifg=#81A1C1
    hi LineNr guibg=None guifg=#7c8f8f
    hi LspDiagnosticsError guifg=#ff6c6b
    hi LspDiagnosticsWarning guifg=#FF8C00
    hi QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
    hi QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END
endf

autocmd ColorScheme * call SelfDefinedHighlight()

colorscheme nord

