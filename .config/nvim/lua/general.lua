vim.cmd("syntax on")

HOME = vim.fn.getenv("HOME")

vim.cmd("colorscheme nord")
vim.opt.completeopt = {"menuone","noselect"}
vim.opt.relativenumber = true
vim.opt.nu = true
vim.opt.encoding = "UTF-8"
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.smartcase = true
vim.opt.undodir = HOME .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.colorcolumn = "150"
vim.opt.cindent = true
vim.opt.tabstop=4 softtabstop=4
vim.opt.scrolloff = 999
vim.opt.shiftwidth = 4
vim.opt.background = "dark"
vim.opt.hidden = true
vim.opt.updatetime = 300
vim.opt.signcolumn="yes"
vim.opt.mouse="a"
vim.opt.title = true

vim.cmd("command! -nargs=0 Prettier :CocCommand prettier.formatFile")
vim.cmd("command! -nargs=0 Format :call CocAction('format') ")
vim.cmd("command! -nargs=? Fold :call     CocAction('fold', <f-args>)")
vim.cmd("command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')")

vim.cmd([[
augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
]])

vim.cmd("hi! Normal ctermbg=NONE guibg=NONE")

--
vim.cmd([[
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
]])
