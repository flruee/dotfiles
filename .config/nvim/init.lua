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

--[[
vim.g.rustaceanvim = {
    tools = {
        -- ...
    },
    server = {
        on_attach = function(client, bufnr)
            local opts = { buffer = bufnr, remap = false }
            vim.keymap.set("n", "gd", vim.lsp.buf.declaration, opts)
            vim.keymap.set("n", "gD", vim.lsp.buf.definition, opts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
            vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
            vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
        end,
        default_settings = {
            -- rust-analyzer language server configuration
            ['rust-analyzer'] = {

                cargo = {
                    allFeatures = true,
                },
                checkOnSave = {
                    allFeatures = true,
                    command = 'clippy',
                },
                procMacro = {
                    ignored = {
                        ['async-trait'] = { 'async_trait' },
                        ['napi-derive'] = { 'napi' },
                        ['async-recursion'] = { 'async_recursion' },
                    },
                },
            },
        },
        -- ...
    },
    dap = {
        -- ...
    },
}
]]
