vim.g.completeopt = 'menu,menuone,noselect'

-- diagnostic display config
vim.diagnostic.config({
	virtual_text = {
		prefix = '●',
		spacing = 2,
	},
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

-- nvim-cmp setup
local cmp = require 'cmp'

cmp.setup({
	window = {
		--completion = cmp.config.window.bordered(),
		--documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		-- { name = 'vsnip' }, -- For vsnip users.
		{ name = 'luasnip' }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
	}, {
		{ name = 'buffer' },
	}),
	snippet = {
		expand = function(args)
			require 'luasnip'.lsp_expand(args.body)
		end
	},
})

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Apply capabilities to all LSP servers via wildcard config
vim.lsp.config('*', {
	capabilities = capabilities,
})

-- enable language servers (configs are in ~/.config/nvim/lsp/)
local servers = { 'bashls', 'rust_analyzer', 'pyright', 'ts_ls', 'gopls', 'clangd', 'tinymist', 'lua_ls', 'ocamld' }

vim.api.nvim_create_autocmd('VimEnter', {
	callback = function()
		for _, lsp in ipairs(servers) do
			vim.lsp.enable(lsp)
		end
	end,
})
