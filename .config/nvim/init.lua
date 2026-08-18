require("vim._core.ui2").enable({})

require("binds")
require("pack")
require("options")
require("commands")

require("nord").setup({
    transparent = true,
    terminal_colors = true,
})
vim.cmd.colorscheme('nord')

require('plugins.lualine')
require('plugins.mini')
require('plugins.ibl')
require('plugins.autopairs')
require('plugins.cord')
require('plugins.peek')
require('plugins.highlight')
