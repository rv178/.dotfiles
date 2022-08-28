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
	use("tpope/vim-fugitive")
	use("airblade/vim-gitgutter")
	use("Xuyuanp/nerdtree-git-plugin")

	use("lewis6991/impatient.nvim")
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")
	use("scrooloose/nerdtree")
	use("scrooloose/nerdcommenter")
	use("prettier/vim-prettier", {["run"] = "yarn install"})
	use("github/copilot.vim")
	use("steelsojka/pears.nvim")

	use("arcticicestudio/nord-vim")
	use("vim-airline/vim-airline")
	use("vim-airline/vim-airline-themes")
	use("ryanoasis/vim-devicons")
	use("ap/vim-css-color")
	use("psliwka/vim-smoothie")

	use("neovim/nvim-lspconfig")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("saadparwaiz1/cmp_luasnip")
	use ("L3MON4D3/LuaSnip")

	if packer_bootstrap then
		require("packer").sync()
	end
end

local config = {
	display = {
		open_fn = require("packer.util").float,
	},
	compile_path = vim.fn.stdpath("config") .. "/lua/plugins/packer_compiled.lua",
}

return packer.startup({
	plugins,
	config = config,
})
