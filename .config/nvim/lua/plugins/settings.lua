require('pears').setup()

-- airline
vim.g['airline#extensions#tabline#enabled'] = 1
vim.g.airline_theme = 'nord'
vim.cmd("let g:airline_section_z = airline#section#create(['windowswap', 'obsession', 'linenr', 'maxlinenr'])")

-- vim smoothie
vim.g.smoothie_enabled = 1

-- nvim-tree.lua setup
require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		adaptive_size = false,
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
			},
		},
	},
	renderer = {
		indent_markers = {
			enable = true,
			inline_arrows = true,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				none = " ",
			},
		}
	},
	filters = {
		dotfiles = false,
	},
})

vim.cmd("highlight NvimTreeFolderIcon guibg=blue")
