local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
	'clangd',
	'sumneko_lua',
	'rust_analyzer',
})

local cmp = require('cmp')
local cmp_select = { behaviour = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-i>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-o>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-p>'] = cmp.mapping.confirm({ select = true }),
	['<C-Space>'] = cmp.mapping.complete(),
})

lsp.set_preferences({
	sign_icons = {}
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set('n', "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set('n', "gr", function() vim.lsp.buf.references() end, opts)

	vim.keymap.set('n', "<leader>ls", function() vim.lsp.buf.document_symbol() end, opts)
	vim.keymap.set('n', "<leader>lS", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set('n', "<leader>lf", function() vim.lsp.buf.format() end, opts)

	vim.keymap.set('n', "<leader>lq", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set('n', "<leader>lj", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set('n', "<leader>lk", function() vim.diagnostic.goto_prev() end, opts)

	vim.keymap.set('n', "<leader>la", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set('n', "<leader>lr", function() vim.lsp.buf.rename() end, opts)

end)

lsp.setup()

