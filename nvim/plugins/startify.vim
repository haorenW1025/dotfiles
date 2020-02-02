let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   Most Recently Use']            },
        \ { 'type': 'dir',       'header': ['   Most Recently Use in '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]
let g:startify_files_number = 5
let g:startify_change_to_vcs_root = 1
let g:startify_padding_left = 5
let g:startify_session_autoload = 1


let g:ascii = [
\ 'MMMMMMMM               MMMMMMMMYYYYYYY       YYYYYYYVVVVVVVV           VVVVVVVVIIIIIIIIIIMMMMMMMM               MMMMMMMM',
\ 'M:::::::M             M:::::::MY:::::Y       Y:::::YV::::::V           V::::::VI::::::::IM:::::::M             M:::::::M',
\ 'M::::::::M           M::::::::MY:::::Y       Y:::::YV::::::V           V::::::VI::::::::IM::::::::M           M::::::::M',
\ 'M:::::::::M         M:::::::::MY::::::Y     Y::::::YV::::::V           V::::::VII::::::IIM:::::::::M         M:::::::::M',
\ 'M::::::::::M       M::::::::::MYYY:::::Y   Y:::::YYY V:::::V           V:::::V   I::::I  M::::::::::M       M::::::::::M',
\ 'M:::::::::::M     M:::::::::::M   Y:::::Y Y:::::Y     V:::::V         V:::::V    I::::I  M:::::::::::M     M:::::::::::M',
\ 'M:::::::M::::M   M::::M:::::::M    Y:::::Y:::::Y       V:::::V       V:::::V     I::::I  M:::::::M::::M   M::::M:::::::M',
\ 'M::::::M M::::M M::::M M::::::M     Y:::::::::Y         V:::::V     V:::::V      I::::I  M::::::M M::::M M::::M M::::::M',
\ 'M::::::M  M::::M::::M  M::::::M      Y:::::::Y           V:::::V   V:::::V       I::::I  M::::::M  M::::M::::M  M::::::M',
\ 'M::::::M   M:::::::M   M::::::M       Y:::::Y             V:::::V V:::::V        I::::I  M::::::M   M:::::::M   M::::::M',
\ 'M::::::M    M:::::M    M::::::M       Y:::::Y              V:::::V:::::V         I::::I  M::::::M    M:::::M    M::::::M',
\ 'M::::::M     MMMMM     M::::::M       Y:::::Y               V:::::::::V          I::::I  M::::::M     MMMMM     M::::::M',
\ 'M::::::M               M::::::M       Y:::::Y                V:::::::V         II::::::IIM::::::M               M::::::M',
\ 'M::::::M               M::::::M    YYYY:::::YYYY              V:::::V          I::::::::IM::::::M               M::::::M',
\ 'M::::::M               M::::::M    Y:::::::::::Y               V:::V           I::::::::IM::::::M               M::::::M',
\ 'MMMMMMMM               MMMMMMMM    YYYYYYYYYYYYY                VVV            IIIIIIIIIIMMMMMMMM               MMMMMMMM',
\ '', 
\ '',
\]
let g:startify_custom_header = 'startify#center(g:ascii)'

if filereadable(expand('~/.cache/startify_bookmarks'))
    source ~/.cache/startify_bookmarks
endif

