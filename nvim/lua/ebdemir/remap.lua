vim.g.mapleader = " "
vim.keymap.set('n', "<leader>e", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "}", "}zz")
vim.keymap.set("n", "{", "{zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>c", "<CMD>bd<CR>")
vim.keymap.set("n", "<leader>C", "<CMD>bd!<CR>")

vim.keymap.set("n", "<C-l>", "<CMD>bn<CR>")
vim.keymap.set("n", "<C-h>", "<CMD>bp<CR>")
vim.keymap.set("n", "<A-h>", "<CMD>ClangdSwitchSourceHeader<CR>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>qo", "<CMD>copen<CR>")
vim.keymap.set("n", "<leader>qn", "<CMD>cnext<CR>")
vim.keymap.set("n", "<leader>qp", "<CMD>cprev<CR>")

vim.keymap.set("n", "<leader>Qp", ":Cppman <C-r><C-w><CR>gg")
vim.keymap.set("n", "<leader>Qh", ":Cht <C-r><C-w>")

vim.keymap.set("v", "<leader>Qp", [["vy:Cppman <C-r>v<CR>gg]])
vim.keymap.set("v", "<leader>Qh", [["vy:Cht <C-r>v]])
