local lsp = require('lsp-zero')
local builtin = require('telescope.builtin')

lsp.preset('recommended')

lsp.ensure_installed({
	'clangd',
	'rust_analyzer',
})

local cmp = require('cmp')
local cmp_select = { behaviour = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-o>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-i>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-p>'] = cmp.mapping.confirm({ select = true }),
	['<C-Space>'] = cmp.mapping.complete(),
})

lsp.set_preferences({
    sign_icons = {}
})

local ELLIPSIS_CHAR = '…'
local MAX_LABEL_WIDTH = 30
local MIN_LABEL_WIDTH = 30

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
	formatting = {
		format = function(entry, vim_item)
			local label = vim_item.abbr
			local truncated_label = vim.fn.strcharpart(label, 0, MAX_LABEL_WIDTH)
			if truncated_label ~= label then
				vim_item.abbr = truncated_label .. ELLIPSIS_CHAR
			elseif string.len(label) < MIN_LABEL_WIDTH then
				local padding = string.rep(' ', MIN_LABEL_WIDTH - string.len(label))
				vim_item.abbr = label .. padding
			end
			return vim_item
		end,
	},
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set('n', "gd", builtin.lsp_definitions, opts)
	vim.keymap.set('n', "gr", builtin.lsp_references, opts)

	vim.keymap.set('n', '<leader>ls', builtin.lsp_document_symbols, {})
	vim.keymap.set('n', '<leader>lS', builtin.lsp_workspace_symbols, {})
	vim.keymap.set('n', "<leader>lf", function() vim.lsp.buf.format() end, opts)

	vim.keymap.set('n', "<leader>lq", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set('n', "<leader>lj", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set('n', "<leader>lk", function() vim.diagnostic.goto_prev() end, opts)

	vim.keymap.set('n', "<leader>la", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set('n', "<leader>lr", function() vim.lsp.buf.rename() end, opts)

end)

vim.lsp.set_log_level("ERROR")

lsp.setup()
