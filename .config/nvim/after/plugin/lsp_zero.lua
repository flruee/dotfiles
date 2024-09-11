local lsp = require('lsp-zero')

lsp.extend_lspconfig({
    sign_text = true,
    float_border = "single"
})
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { 'lua_ls', 'rust_analyzer', 'pyright' },
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
        lua_ls = function()
            require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
        end,
        rust_analyzer = function()
            require('lspconfig').rust_analyzer.setup({
                settings = {
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
            })
        end

    }
})

lsp.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ['lua_ls'] = { 'lua' },
        ['rust_analyzer'] = { 'rust' },
        -- if you have a working setup with null-ls
        -- you can specify filetypes it can format.
        -- ['null-ls'] = {'javascript', 'typescript'},
    }
})
lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "gd", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
end)

-- (Optional) Configure lua language server for neovim

--lsp.setup()
