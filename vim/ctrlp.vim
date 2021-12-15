let g:ctrlp_buffer_func = {
        \ 'enter': 'HideStatusline',
        \ 'exit': 'ShowStatusline',
      \ }

func! HideStatusline()
    set laststatus=0
endfunc

func! ShowStatusline()
    set laststatus=2
endfunc
