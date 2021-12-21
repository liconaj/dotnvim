let g:go_def_mapping_enabled = 0

set updatetime=300
set shortmess+=c
set signcolumn=number

let g:coc_global_extensions = [
            \ 'coc-json',
            \ 'coc-git',
            \ 'coc-go',
            \ 'coc-html',
            \ 'coc-pyright',
            \ 'coc-toml',
            \ 'coc-vimlsp',
            \ 'coc-snippets',
            \ 'coc-prettier',
            \ 'coc-highlight',
            \ 'coc-lua',
            \ 'coc-pairs',
            \ ]

command! -nargs=0 Prettier :CocCommand prettier.formatFile
command! -nargs=0 Format :call CocAction('format')

nnoremap <leader>F :FormatWrite<CR>

inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

imap <C-l> <Plug>(coc-snippets-expand)

imap <C-j> <Plug>(coc-snippets-expand-jump)
vmap <C-j> <Plug>(coc-snippets-expand)
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
"autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac <Plug>(coc-codeaction)

" Apply AutoFix to problem on the current line.
nmap <leader>qf <Plug>(coc-fix-current)

hi! CocUnderline gui=undercurl cterm=underline

hi! link CocErrorSign           DiagnosticError
hi! link CocErrorFloat          DiagnosticError
hi! link CocErrorVirtualText    DiagnosticError
hi! link CocErrorHighlight      DiagnosticUnderlineError

hi! link CocWarningSign         DiagnosticWarn
hi! link CocWarningFloat        DiagnosticWarn
hi! link CocWarningVirtualText  DiagnostictWarn
hi! link CocWarningHighlight    DiagnosticUnderlineWarn

hi! link CocHintSign         DiagnosticHint
hi! link CocHintFloat        DiagnosticHint
hi! link CocHintVirtualText  DiagnosticHint
hi! link CocHintHighlight    DiagnosticUnderlineHint


" Just for guide
" ErrorMsg ctermfg=15 ctermbg=1 gui=bold,italic guifg=#E28C8C
" Error ctermfg=15 ctermbg=9 guifg=#E28C8C
" SpellBad ctermbg=9 gui=undercurl guisp=#E28C8C
" SpellCap ctermbg=12 gui=undercurl guisp=#EADDA0
" SpellRare ctermbg=13 gui=undercurl guisp=#9DDDCB

let g:coc_filetypes_enable = ['vim', 'sh', 'py', 'lua']

function! s:disable_coc_for_type()
    if index(g:coc_filetypes_enable, &filetype) == -1
        :silent! CocDisable
    else
        :silent! CocEnable
    endif
endfunction

augroup CocGroup
    autocmd!
    autocmd BufNew,BufEnter,BufAdd,BufCreate * call s:disable_coc_for_type()
augroup end

