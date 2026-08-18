vim.g.mapleader = " "

local function map(mode, combo, mapping, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, combo, mapping, options)
end

-- leader
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { noremap = true, desc = 'Open telescope buffers' })
vim.keymap.set('n', '<leader>]', ':bnext<CR>')
vim.keymap.set('n', '<leader>[', ':bprev<CR>')

-- markdown live preview
vim.keymap.set('n', '<leader>po', ":lua require('peek').open()<CR>", { noremap = true })  -- open
vim.keymap.set('n', '<leader>pc', ":lua require('peek').close()<CR>", { noremap = true }) -- close

-- control
vim.keymap.set('n', '<C-p>', '<cmd>Telescope find_files<cr>', { noremap = true })
vim.keymap.set('n', '<C-G>', '<cmd>Telescope live_grep<cr>', { noremap = true })
vim.keymap.set('n', '<C-s>', ':w', { noremap = true })

-- built-in commenting (gc/gcc)
map('n', 'cc', 'gcc', { noremap = false })
map('x', 'cc', 'gc', { noremap = false })

-- txm (latex preview) commands
vim.keymap.set('v', '<leader>tx', '<Plug>(TxmPreview)', { noremap = true })
vim.keymap.set('n', '<leader>tt', ':TxmToggle<CR>', { noremap = true })

-- selection
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true, desc = 'Move lines down in visual selection' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true, desc = 'Move lines up in visual selection' })
vim.keymap.set('v', '>', ">gv", { noremap = true, desc = 'Indent and keep selection' })
vim.keymap.set('v', '<', "<gv", { noremap = true, desc = 'Unindent and keep selection' })
vim.keymap.set('n', 'Y', 'y$', { noremap = true })
vim.keymap.set('v', 'Y', '"+y', { noremap = true })

-- movement
-- vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true, desc = 'Move down in buffer centered' })
-- vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true, desc = 'Move up in buffer centered' })
vim.keymap.set('n', 'n', 'nzzzv', { noremap = true, desc = 'Next search result cursor centered' })
vim.keymap.set('n', 'N', 'Nzzzv', { noremap = true, desc = 'Previous search result cursor centered' })

-- undotree
vim.keymap.set("n", "<leader>u", function()
    vim.cmd.packadd("nvim.undotree")
    require("undotree").open()
end, { desc = "Toggle built-in undotree" })

-- minifiles
vim.keymap.set('n', '-', '<cmd>lua MiniFiles.open()<CR>', { desc = 'Toggle mini file explorer' })

-- lsp keybinds
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { desc = "Format Local buffer" })
vim.keymap.set('n', 'df', vim.diagnostic.open_float, { desc = "Show line diagnostics" })

-- others
vim.keymap.set('n', 'Q', '<Nop>', { noremap = true })
vim.keymap.set('n', '<esc>', ':noh<cr>', { noremap = true })
vim.keymap.set('n', '<leader>re', '<cmd>restart<cr>', { noremap = true, desc = 'Restart config :restart' })
