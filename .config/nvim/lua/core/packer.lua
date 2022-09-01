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

	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")

	use("github/copilot.vim")
	use("arcticicestudio/nord-vim")
	use("airblade/vim-gitgutter")
	use("vim-airline/vim-airline")
	use({
	'kyazdani42/nvim-tree.lua',
	requires = {
		'kyazdani42/nvim-web-devicons', -- optional, for file icons
		},
	})

	use("windwp/nvim-autopairs")
	use("scrooloose/nerdcommenter")
	use("neovim/nvim-lspconfig")
	use("L3MON4D3/LuaSnip")
	use('nvim-treesitter/nvim-treesitter')
	use({
	"hrsh7th/nvim-cmp",
	requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-buffer",
			"saadparwaiz1/cmp_luasnip",
		},
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
