require("ebdemir.remap")
require("ebdemir.set")
require("ebdemir.cht")

vim.cmd([[au TextYankPost * silent! lua vim.highlight.on_yank()]])
