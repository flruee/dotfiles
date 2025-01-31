return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer", -- source for text in buffer
        "hrsh7th/cmp-path",   -- source for file system paths
        'hrsh7th/cmp-cmdline',
        {
            "L3MON4D3/LuaSnip",
            version = "v2.*",
            -- install jsregexp (optional!).
            build = "make install_jsregexp",
        },
        'hrsh7th/cmp-nvim-lsp',
        "rafamadriz/friendly-snippets",

        "onsails/lspkind.nvim", -- vs-code like pictograms
    },

    config = function()
        -- Set up lspconfig.
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
        require('lspconfig')['clangd'].setup {
            capabilities = capabilities
        }
        require('lspconfig')['basedpyright'].setup {
            capabilities = capabilities
        }
        local lspkind = require("lspkind")
        local cmp = require("cmp")
        cmp.setup({
            preselect = false,

            formatting = {
                format = lspkind.cmp_format({
                    mode = 'symbol', -- show only symbol annotations
                    maxwidth = {
                        -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                        -- can also be a function to dynamically calculate max width such as
                        -- menu = function() return math.floor(0.45 * vim.o.columns) end,
                        menu = 50,            -- leading text (labelDetails)
                        abbr = 50,            -- actual suggestion item
                    },
                    ellipsis_char = '...',    -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
                    show_labelDetails = true, -- show labelDetails in menu. Disabled by default

                    -- The function below will be called before any actual modifications from lspkind
                    -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
                    before = function(entry, vim_item)
                        -- ...
                        return vim_item
                    end
                })
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ["C-<CR>"] = cmp.mapping.confirm({ select = true }),
                ["C-Enter"] = cmp.mapping.confirm({ select = true })
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                -- { name = 'vsnip' }, -- For vsnip users.
                -- { name = 'luasnip' }, -- For luasnip users.
                -- { name = 'ultisnips' }, -- For ultisnips users.
                -- { name = 'snippy' }, -- For snippy users.
            }, {
                { name = 'buffer' },
            })
        })
        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                { name = 'cmdline' }
            })
        })
        --[[
        -- Use buffer source for `/` and `?`.
        cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
        { name = 'buffer' }
        }
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
        { name = 'path' }
        }, {
        { name = 'cmdline' }
        })
        })
        -- Set up lspconfig.
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
        require('lspconfig')['clangd'].setup {
        capabilities = capabilities
        }
        ]]
    end
}
