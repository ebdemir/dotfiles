local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>F', builtin.find_files, {})
vim.keymap.set('n', '<leader>f', builtin.git_files, {})
vim.keymap.set('n', '<leader>tg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})

vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})
vim.keymap.set('n', '<leader>gb', builtin.git_bcommits, {})
vim.keymap.set('n', '<leader>gs', builtin.git_status, {})

local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        mappings = {
            i = { ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist, },
            n = { ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist, },
        },
        layout_strategy = 'vertical',
    }
}
