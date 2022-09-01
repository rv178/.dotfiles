local present, autopairs = pcall(require, "nvim-autopairs")

if not present then
	return
end

require('nvim-autopairs').setup({
	disable_filetype = { "TelescopePrompt" , "vim" },
})
