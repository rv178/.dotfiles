vim.g['airline#extensions#tabline#enabled'] = 1
vim.g.airline_theme = 'nord'
vim.cmd("let g:airline_section_z = airline#section#create(['windowswap', 'obsession', 'linenr', 'maxlinenr'])")

vim.g.WebDevIconsUnicodeDecorateFolderNodes = 1
vim.g.NERDTreeGitStatusUseNerdFonts = 1
vim.g.NERDTreeGitStatusShowIgnored = 1
vim.g.NERDTreeGitStatusShowClean = 1
vim.g.NERDTreeGitStatusWithFlags = 1
vim.g.NERDTreeWinSize = 20

vim.g['prettier#quickfix_enabled'] = 0
vim.g['prettier#quickfix_auto_focus'] = 0
vim.g['prettier#autoformat'] = 1
vim.g['prettier#autoformat_require_pragma'] = 0
vim.g.smoothie_enabled = 1
vim.g.coc_global_extensions = {
	'coc-snippets',
	'coc-rls',
	--\ 'coc-java',
	'coc-go',
	'coc-discord-rpc',
	'coc-pairs',
	'coc-prettier',
	'coc-json',
}
