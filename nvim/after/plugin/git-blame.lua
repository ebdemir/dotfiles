require('gitblame').setup {
    enabled = false,
}
vim.keymap.set('n', '<leader>gl', "<CMD>GitBlameToggle<CR>", {})
