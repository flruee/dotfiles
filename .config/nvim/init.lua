require('config.lazy')
require("flo")

vim.wo.number = true
vim.wo.relativenumber = true
local set = vim.opt
local TAB_WIDTH = 4

set.tabstop = TAB_WIDTH
set.shiftwidth = TAB_WIDTH
set.softtabstop = TAB_WIDTH
set.expandtab = true

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('i', 'jk', '<esc>')
vim.keymap.set({ 'n', 'i', 'v' }, '<UP>', "")
vim.keymap.set({ 'n', 'i', 'v' }, '<DOWN>', "")
vim.keymap.set({ 'n', 'i', 'v' }, '<RIGHT>', "")
vim.keymap.set({ 'n', 'i', 'v' }, '<LEFT>', "")
vim.keymap.set('n', "]q", ":cn<CR>")
vim.keymap.set('n', "[q", ":cp<CR>")
