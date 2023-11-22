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
	use("lewis6991/impatient.nvim")

	-- required for telescope
	use("nvim-lua/popup.nvim")
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
	-- tree plugin for viewing project tree
	use({
	"kyazdani42/nvim-tree.lua",
		requires = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icons
		},
		cmd = { "NvimTreeToggle", "NvimTreeFocus" },
		config = "require('plugins.settings.nvimtree')"
	})
	-- bracket autocompletion
	use({
		"windwp/nvim-autopairs",
		after = "nvim-cmp",
		config = "require('plugins.settings.autopairs')"
	})
	-- auto comment on keybind
	use("scrooloose/nerdcommenter")
	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		event = "BufWinEnter",
		config = "require('plugins.settings.treesitter')"
	})
	-- lsp stuff
	use("neovim/nvim-lspconfig")
	use({"L3MON4D3/LuaSnip"})
	use({"lukas-reineke/indent-blankline.nvim"})
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
	use({
		"andweeb/presence.nvim",
		config = "require('plugins.settings.presence')"
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
