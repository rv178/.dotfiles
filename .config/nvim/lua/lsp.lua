require('mason').setup()
require("mason-lspconfig").setup {
    ensure_installed = {
        'lua_ls',
        'marksman',
        'gopls',
        'rust_analyzer',
        'ocamllsp',
        'bashls',
        'clangd',
        'pyright',
        'tinymist',
        'ts_ls',
        'nil_ls'
    },
}

vim.diagnostic.config({
    virtual_text = true,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("mini.completion").get_lsp_capabilities())

vim.lsp.config("*", { capabilities = capabilities })

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } },
        },
    },
})

vim.lsp.enable({
    'lua_ls',
    'marksman',
    'gopls',
    'rust_analyzer',
    'ocamllsp',
    'bashls',
    'clangd',
    'pyright',
    'tinymist',
    'ts_ls',
    'nil_ls'
})
