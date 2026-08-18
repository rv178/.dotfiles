vim.g.netrw_banner = 0

vim.opt.termguicolors = true
vim.opt.title = true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 999
vim.wo.wrap = false
vim.opt.colorcolumn = "150"
vim.opt.signcolumn = "yes"

-- indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.cindent = true

vim.opt.encoding = "UTF-8"
vim.opt.wrap = false
vim.opt.smartindent = true
vim.opt.inccommand = "split"
vim.opt.updatetime = 300
vim.opt.mouse = "a"

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.laststatus = 3

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath("data") .. "./undodir"
vim.opt.undofile = true

-- vim.opt.clipboard:append("unnamedplus")
vim.opt.isfname:append("@-@")

-- completion
vim.opt.completeopt = "menuone,noselect,fuzzy,nosort"
vim.opt.shortmess:append("c")
vim.opt.incsearch = true
vim.opt.smartcase = true

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    callback = function()
        vim.hl.on_yank()
    end,
})

vim.cmd([[
autocmd BufWritePre *.js lua vim.lsp.buf.format(nil, 100)
autocmd BufWritePre *.jsx lua vim.lsp.buf.format(nil, 100)
autocmd BufWritePre *.tsx lua vim.lsp.buf.format(nil, 100)
autocmd BufWritePre *.ts lua vim.lsp.buf.format(nil, 100)
autocmd BufWritePre *.rs lua vim.lsp.buf.format(nil, 100)
autocmd BufWritePre *.py lua vim.lsp.buf.format(nil, 100)
autocmd BufWritePre *.html lua vim.lsp.buf.format(nil, 100)
autocmd BufWritePre *.css lua vim.lsp.buf.format(nil, 100)
autocmd BufWritePre *.go lua vim.lsp.buf.format(nil, 100)
autocmd BufWritePre *.lua lua vim.lsp.buf.format(nil, 100)
autocmd BufWritePre *.ml lua vim.lsp.buf.format(nil, 100)
autocmd BufWritePre *.nix lua vim.lsp.buf.format(nil, 100)
]])

-- theme settings
vim.g.nord_contrast = true
vim.g.nord_borders = true
vim.g.nord_disable_background = true
vim.g.nord_italic = true
vim.g.nord_uniform_diff_background = true
