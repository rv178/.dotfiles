local present, nvimtree = pcall(require, "nvim-tree")

if not present then
	return
end

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
