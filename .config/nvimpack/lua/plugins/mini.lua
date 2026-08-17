-- minifiles
local MiniFiles = require('mini.files')
MiniFiles.setup({
    mappings = {
        go_in = '<CR>',
        go_in_plus = 'L',
        go_out = '_',
        go_out_plus = 'H',
    },
})

-- remap = to :w
vim.api.nvim_create_autocmd('User', {
    pattern = 'MiniFilesBufferCreate',
    callback = function(args)
        vim.keymap.set('n', ':w<CR>', MiniFiles.synchronize, {
            buffer = args.data.buf_id,
            desc = 'Synchronize mini.files',
        })
    end,
})

-- mininotify
require('mini.notify').setup({
    content = {
        format = function(notif)
            return notif.msg
        end,
    },
})

--- mini cmdline completion
require('mini.cmdline').setup({
    autocorrect = { enable = false }
})

--- mini surround
require('mini.surround').setup()

--  mini completion
require("mini.completion").setup({
    lsp_completion = {
        auto_setup = true,
    }
})

-- mini snippets
local MiniSnippets = require("mini.snippets")
MiniSnippets.setup({
    snippets = {
        -- loads friendly-snippets
        MiniSnippets.gen_loader.from_lang(),
    },
    expand = {
        insert = function(snippet)
            MiniSnippets.default_insert(snippet, { empty_tabstop = "" })
        end,
    },
})
MiniSnippets.start_lsp_server({ match = false })

vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        vim.api.nvim_set_hl(0, "MiniSnippetsCurrent", {})
        vim.api.nvim_set_hl(0, "MiniSnippetsCurrentReplace", {})
        vim.api.nvim_set_hl(0, "MiniSnippetsFinal", {})
        vim.api.nvim_set_hl(0, "MiniSnippetsUnvisited", {})
        vim.api.nvim_set_hl(0, "MiniSnippetsVisited", {})
    end,
})
