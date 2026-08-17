vim.g.mapleader = " "

local function map(mode, combo, mapping, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, combo, mapping, options)
end

-- leader
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { noremap = true, desc = 'Open telescope buffers' })
map('n', '<leader>p', '*yy', { noremap = true })
map('n', '<leader>p', '*y', { noremap = true })
map('n', '<leader>]', ':bnext<CR>')
map('n', '<leader>[', ':bprev<CR>')

-- markdown live preview
map('n', '<leader>po', ":lua require('peek').open()<CR>", { noremap = true })  -- open
map('n', '<leader>pc', ":lua require('peek').close()<CR>", { noremap = true }) -- close

-- control
map('n', '<C-p>', '<cmd>Telescope find_files<cr>', { noremap = true })
map('n', '<C-G>', '<cmd>Telescope live_grep<cr>', { noremap = true })
map('n', '<C-s>', ':w', { noremap = true })

-- built-in commenting (gc/gcc)
map('n', 'cc', 'gcc', { noremap = false })
map('x', 'cc', 'gc', { noremap = false })

-- txm (latex preview) commands
map('v', '<leader>tx', '<Plug>(TxmPreview)', { noremap = true })
map('n', '<leader>tt', ':TxmToggle<CR>', { noremap = true })

-- selection
map('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true, desc = 'Move lines down in visual selection' })
map('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true, desc = 'Move lines up in visual selection' })
map('v', '>', ">gv", { noremap = true, desc = 'Indent and keep selection' })
map('v', '<', "<gv", { noremap = true, desc = 'Unindent and keep selection' })

-- movement
-- map('n', '<C-d>', '<C-d>zz', { noremap = true, desc = 'Move down in buffer centered' })
-- map('n', '<C-u>', '<C-u>zz', { noremap = true, desc = 'Move up in buffer centered' })
map('n', 'n', 'nzzzv', { noremap = true, desc = 'Next search result cursor centered' })
map('n', 'N', 'Nzzzv', { noremap = true, desc = 'Previous search result cursor centered' })

-- undotree
vim.keymap.set("n", "<leader>u", function()
    vim.cmd.packadd("nvim.undotree")
    require("undotree").open()
end, { desc = "Toggle built-in undotree" })

-- minifiles
map('n', '-', '<cmd>lua MiniFiles.open()<CR>', { desc = 'Toggle mini file explorer' })
-- map('n', '-', '<cmd>Oil<CR>', { desc = 'Toggle mini file explorer' })

-- others
map('n', 'Y', 'y$', { noremap = true })
map('n', 'Q', '<Nop>', { noremap = true })
map('n', '<esc>', ':noh<cr>', { noremap = true })
map('n', '<leader>re', '<cmd>restart<cr>', { noremap = true, desc = 'Restart config :restart' })
