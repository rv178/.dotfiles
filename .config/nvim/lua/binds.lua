local function map(mode, combo, mapping, opts)
	local options = {noremap = true}
	if opts then
		options = vim.tbl_extend('force', options, opts)
	end
	vim.api.nvim_set_keymap(mode, combo, mapping, options)
end

-- leader

vim.g.mapleader = " "

map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', {noremap=true})

map('n', "<leader>1", "1gt", {noremap=true})
map('n', "<leader>2", "2gt", {noremap=true})
map('n', "<leader>3", "3gt", {noremap=true})
map('n', "<leader>4", "4gt", {noremap=true})
map('n', "<leader>5", "5gt", {noremap=true})
map('n', "<leader>6", "6gt", {noremap=true})
map('n', "<leader>7", "7gt", {noremap=true})
map('n', "<leader>8", "8gt", {noremap=true})
map('n', "<leader>9", "9gt", {noremap=true})
map('n', '<leader>0', ':tablast<cr>', {noremap=true})

map('n', '<leader>p', '*yy', {noremap=true})
map('n', '<leader>p', '*y', {noremap=true})

map('n', '<leader>+', ':vertical resize +5<CR>', {noremap=true})
map('n', '<leader>-', ':vertical resize -5<CR>', {noremap=true})

-- control

map('n', '<C-p>', '<cmd>Telescope find_files<cr>', {noremap=true})
map('n', '<C-s>', ':w', {noremap=true})
map('n', '<C-G>', '<cmd>Telescope live_grep<cr>', {noremap=true})
map('n', '<C-s>', ':w', {noremap=true})

map('n', '<C-n>', ':NvimTreeToggle<CR>')

-- remap ctrl + u/d to shift + up/down
map('n', '<S-up>', '<C-u>', {noremap=true})
map('n', '<S-down>', '<C-d>', {noremap=true})

-- others

map('n', 'Y', 'y$', {noremap=true})
map('n', 'Q', '<Nop>', {noremap=true})
map('n', '<esc>', ':noh<cr>', {noremap=true})

map('n', 'cc', '<Plug>NERDCommenterToggle')
map('v', 'cc', '<Plug>NERDCommenterToggle')
map('n', '<silent> gr', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', '<silent> gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
map('n', '<silent> K', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', '<silent> C-k', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
map('n', '<silent> C-n', '<cmd>lua vim.diagnostic.goto_prev<CR>')
map('n', '<silent> C-p', '<cmd>lua vim.diagnostic.goto_next()<CR>')

local on_attach = function(client, bufnr)
	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap=true, silent=true, buffer=bufnr }
	map('n', 'gD', vim.lsp.buf.declaration, bufopts)
	map('n', 'gd', vim.lsp.buf.definition, bufopts)
	map('n', 'K', vim.lsp.buf.hover, bufopts)
	map('n', 'gi', vim.lsp.buf.implementation, bufopts)
	map('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
	map('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	map('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	map('n', '<space>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	map('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
	map('n', '<space>rn', vim.lsp.buf.rename, bufopts)
	map('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
	map('n', 'gr', vim.lsp.buf.references, bufopts)
	map('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end
