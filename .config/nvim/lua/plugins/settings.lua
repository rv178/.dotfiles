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

require('nvim-treesitter.configs').setup {
	-- A list of parser names, or "all"
	ensure_installed = { "rust" },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	auto_install = true,

	-- List of parsers to ignore installing (for "all")
	ignore_install = { "javascript" },

	highlight = {
		-- `false` will disable the whole extension
		enable = true,

		-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
		-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
		-- the name of the parser)
		-- list of language that will be disabled
		disable = {},

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
}
