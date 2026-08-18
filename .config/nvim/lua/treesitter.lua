local treesitter = require("nvim-treesitter")

local ensure_installed = {
    -- languages
    "go", "rust", "typescript", "javascript", "tsx",
    "html", "css", "json", "bash", "c", "ocaml", "cpp",
    -- extras
    "http", "dockerfile",
}

treesitter.install(ensure_installed)

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function(args)
		local buf = args.buf
		local ft = vim.bo[buf].filetype

		local lang = vim.treesitter.language.get_lang(ft)
		if not lang then
			return
		end

		local ok_add = pcall(vim.treesitter.language.add, lang)
		if not ok_add then
			return
		end

		pcall(vim.treesitter.start, buf, lang)
	end,
})
