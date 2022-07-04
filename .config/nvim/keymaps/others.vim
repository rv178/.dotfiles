nnoremap Y y$
nnoremap Q <Nop>

nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <esc> :noh<CR>

noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

nmap cc <Plug>NERDCommenterToggle
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <F2> <Plug>(coc-rename)

omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

vmap cc <Plug>NERDCommenterToggle

xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)