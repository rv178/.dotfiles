local function map(mode, combo, mapping, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend('force', options, opts)
	end
	vim.api.nvim_set_keymap(mode, combo, mapping, options)
end

-- leader

vim.g.mapleader = " "

map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { noremap = true })

map('n', "<leader>1", "1gt", { noremap = true })
map('n', "<leader>2", "2gt", { noremap = true })
map('n', "<leader>3", "3gt", { noremap = true })
map('n', "<leader>4", "4gt", { noremap = true })
map('n', "<leader>5", "5gt", { noremap = true })
map('n', "<leader>6", "6gt", { noremap = true })
map('n', "<leader>7", "7gt", { noremap = true })
map('n', "<leader>8", "8gt", { noremap = true })
map('n', "<leader>9", "9gt", { noremap = true })
map('n', '<leader>0', ':tablast<cr>', { noremap = true })

map('n', '<leader>p', '*yy', { noremap = true })
map('n', '<leader>p', '*y', { noremap = true })

map('v', '<leader>tx', '<Plug>(TxmPreview)', { noremap = true })
map('n', '<leader>tt', ':TxmToggle<CR>', { noremap = true })

map('n', '<leader>+', ':vertical resize +5<CR>', { noremap = true })
map('n', '<leader>-', ':vertical resize -5<CR>', { noremap = true })

map('n', '<leader>]', ':bnext<CR>')
map('n', '<leader>[', ':bprev<CR>')

-- markdown live preview
map('n', '<leader>po', ":lua require('peek').open()<CR>", { noremap = true })  -- open
map('n', '<leader>pc', ":lua require('peek').close()<CR>", { noremap = true }) -- close

-- control

map('n', '<C-p>', '<cmd>Telescope find_files<cr>', { noremap = true })
map('n', '<C-s>', ':w', { noremap = true })
map('n', '<C-G>', '<cmd>Telescope live_grep<cr>', { noremap = true })
map('n', '<C-s>', ':w', { noremap = true })

map('n', '<C-n>', ':Neotree toggle right<CR>')

-- remap ctrl + u/d to shift + up/down
map('n', '<S-up>', '<C-u>', { noremap = true })
map('n', '<S-down>', '<C-d>', { noremap = true })
map('v', '<S-up>', '<C-u>', { noremap = true })
map('v', '<S-down>', '<C-d>', { noremap = true })

-- others
map('n', 'Y', 'y$', { noremap = true })
map('n', 'Q', '<Nop>', { noremap = true })
map('n', '<esc>', ':noh<cr>', { noremap = true })

-- built-in commenting (gc/gcc)
map('n', 'cc', 'gcc', { noremap = false })
map('x', 'cc', 'gc', { noremap = false })

-- oil.nvim
map('n', '-', '<cmd>Oil<CR>', { noremap = false })

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local bufopts = { silent = true, buffer = args.buf }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
		vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
		vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
		vim.keymap.set('n', '<leader>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, bufopts)
		vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
		vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
		vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
		vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, bufopts)
	end,
})
