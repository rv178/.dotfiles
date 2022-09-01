HOME = vim.fn.getenv("HOME")

vim.cmd("syntax on")
vim.opt.completeopt = {"menuone","noselect"}
vim.opt.relativenumber = true
vim.opt.tgc = true
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
vim.wo.wrap = false

vim.cmd([[
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.tsx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.html lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.css lua vim.lsp.buf.formatting_sync(nil, 100)

au colorscheme * highlight Normal		ctermbg=NONE guibg=NONE
au colorscheme * highlight NonText		ctermbg=NONE guibg=NONE
au colorscheme * highlight Text			ctermbg=NONE guibg=NONE
au colorscheme * highlight LineNr		ctermbg=NONE guibg=NONE
au colorscheme * highlight CursorLineNR	ctermbg=NONE guibg=NONE
au colorscheme * highlight SignColumn	ctermbg=NONE guibg=NONE
]])
