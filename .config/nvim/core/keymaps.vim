let mapleader=" "
nnoremap Y y$
nnoremap Q <Nop>
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <C-s> :w<CR>
nnoremap <C-G> <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>p "*yy
vnoremap <leader>p "*y
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>0 :tablast<cr>
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <esc> :noh<CR>

noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

nmap <leader>rn <Plug>(coc-rename)
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>
nmap <leader>gc :Git commit<CR>
nmap <leader>gp :Git push<CR>
nmap <C-n> :NERDTreeToggle<CR>
nmap cc <Plug>NERDCommenterToggle
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <leader>f  <Plug>(coc-format-selected)
nmap <F2> <Plug>(coc-rename)

omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

vmap cc <Plug>NERDCommenterToggle

xmap if <Plug>(coc-funcobj-i)
xmap <leader>f  <Plug>(coc-format-selected)
xmap af <Plug>(coc-funcobj-a)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <C-Space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"