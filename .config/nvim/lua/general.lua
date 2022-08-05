HOME = vim.fn.getenv("HOME")

vim.cmd("syntax on")
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
vim.opt.statusline = vim.opt.statusline ^ "%{coc#status()}%{get(b:,'coc_current_function','')}"
vim.wo.wrap = false

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
