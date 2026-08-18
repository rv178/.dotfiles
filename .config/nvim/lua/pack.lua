vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if name == 'peek.nvim' and (kind == 'install' or kind == 'update') then
            local result = vim.system(
                { 'deno', 'task', '--quiet', 'build:fast' },
                { cwd = ev.data.path }
            ):wait()

            if result.code ~= 0 then
                vim.notify('Failed to build peek.nvim:\n' .. result.stderr, vim.log.levels.ERROR)
            end
        end
    end,
})

vim.pack.add({
    -- theme
    'https://github.com/shaunsingh/nord.nvim',
    -- utility plugins
    'https://github.com/nvim-mini/mini.nvim',
    -- for telescope
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/nvim-telescope/telescope.nvim',
    -- snippets
    'https://github.com/rafamadriz/friendly-snippets',
    -- treesitter
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter', branch = 'main' },
    -- lsp config
    'https://github.com/neovim/nvim-lspconfig',
    -- mason for managing LSPs
    'https://github.com/mason-org/mason.nvim',
    'https://github.com/mason-org/mason-lspconfig.nvim',
    -- git plugin for showing changes in sidebar
    'https://github.com/airblade/vim-gitgutter',
    -- status bar + bufferline
    'https://github.com/nvim-lualine/lualine.nvim',
    -- bracket autocompletion
    'https://github.com/windwp/nvim-autopairs',
    -- indent guides
    'https://github.com/lukas-reineke/indent-blankline.nvim',
    -- discord rpc
    'https://github.com/vyfor/cord.nvim',
    -- markdown preview
    'https://github.com/toppair/peek.nvim',
    -- highlight colours
    'https://github.com/brenoprata10/nvim-highlight-colors',
    -- typst preview
    'https://github.com/chomosuke/typst-preview.nvim',
    -- ocaml support
    'https://github.com/tarides/ocaml.nvim',
    -- latex preview
    'https://github.com/rv178/txm.nvim',
})

require('treesitter')
require('lsp')
