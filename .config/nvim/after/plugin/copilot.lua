vim.g.copilot_enabled = false
vim.keymap.set(

    "n",
    "<leader>cp",
    ":Copilot<CR>",
    {
        noremap = true,
        silent = true
    }

)
vim.keymap.set({ "i" }, "<C-L>", "<Plug>(copilot-suggest)")
