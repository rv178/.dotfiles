--local M = {}

--M.blankline = function()
	--local present, blankline = pcall(require, "indent_blankline")

	--if not present then
		--return
	--end

	--local options = {
		--indentLine_enabled = 1,
		--filetype_exclude = {
			--"help",
			--"terminal",
			--"alpha",
			--"packer",
			--"lspinfo",
			--"TelescopePrompt",
			--"TelescopeResults",
			--"",
		--},
		--buftype_exclude = { "terminal" },
		--show_trailing_blankline_indent = false,
		--show_first_indent_level = false,
		--show_current_context = true,
		--show_current_context_start = true,
	--}

	--blankline.setup(options)
--end

require("ibl").setup()
