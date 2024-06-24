vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n","<C-h>", vim.cmd.TmuxNavigateLeft)
vim.keymap.set("n","<C-l>", vim.cmd.TmuxNavigateUp)
vim.keymap.set("n","<C-j>", vim.cmd.TmuxNavigateDown)
vim.keymap.set("n","<C-k>", vim.cmd.TmuxNavigateUp)
