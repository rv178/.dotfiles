local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	vim.o.runtimepath = vim.fn.stdpath("data") .. "/site/pack/*/start/*," .. vim.o.runtimepath
end

local packer_status, packer = pcall(require, "packer")
if not packer_status then
	return
end

packer.init({
	git = {
		clone_timeout = 600,
	},
})

local plugins = function(use)
	use("wbthomason/packer.nvim")

	-- required for telescope
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")

	-- nord theme
	use({
		"shaunsingh/nord.nvim",
		config = "vim.cmd[[colorscheme nord]]"
	})

	-- git plugin for showing changes in sidebar
	use("airblade/vim-gitgutter")

	-- status bar + tabline
	use({
		"nvim-lualine/lualine.nvim",
		config = "require('plugins.settings.lualine')"
	})

	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		}
	})
	-- tree plugin for viewing project tree
	--use({
	--"kyazdani42/nvim-tree.lua",
	--requires = {
	--'kyazdani42/nvim-web-devicons', -- optional, for file icons
	--},
	--cmd = { "NvimTreeToggle", "NvimTreeFocus" },
	--config = "require('plugins.settings.nvimtree')"
	--})

	-- bracket autocompletion
	use({
		"windwp/nvim-autopairs",
		after = "nvim-cmp",
		config = "require('plugins.settings.autopairs')"
	})

	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		event = "BufWinEnter",
		config = "require('plugins.settings.treesitter')"
	})

	-- lsp stuff (server configs are native: lsp/*.lua + vim.lsp.enable)
	use({ "L3MON4D3/LuaSnip" })

	-- indent guides
	use({
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = "require('plugins.settings.ibl')"
	})

	-- auto completion/suggestions
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
			"saadparwaiz1/cmp_luasnip",
		},
	})

	-- discord rpc
	use({
		"vyfor/cord.nvim",
		config = "require('plugins.settings.cord')"
	})

	-- markdown preview
	use({
		'toppair/peek.nvim',
		run = 'deno task --quiet build:fast',
		config = "require('plugins.settings.peek')"
	})

	-- highlight colours
	use({
		'brenoprata10/nvim-highlight-colors',
		config = "require('plugins.settings.highlight')"
	})

	-- typst preview
	use({
		'chomosuke/typst-preview.nvim',
		tag = 'v1.*',
		config = function()
			require 'typst-preview'.setup {}
		end,
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end

local config = {
	display = {
		open_fn = require("packer.util").float,
	},
	compile_path = vim.fn.stdpath("config") .. "/lua/plugins/packer_compiled.lua",
	profile = {
		enable = true,
	},
}

return packer.startup({
	plugins,
	config = config,
})
