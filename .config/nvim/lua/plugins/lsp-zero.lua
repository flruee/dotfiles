return {

    'VonHeikemen/lsp-zero.nvim',
    branch = 'v4.x',
    dependencies = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' },             -- Required
        { 'williamboman/mason.nvim',
            config = function()
                require('mason').setup({
                    registries = {
                        "github:mason-org/mason-registry",
                        "github:Crashdummyy/mason-registry"
                    },
                })

            end
        },
        { 'williamboman/mason-lspconfig.nvim' }, -- Optional

        -- Autocompletion
        -- { 'hrsh7th/nvim-cmp' },     -- Required
        -- { 'hrsh7th/cmp-nvim-lsp' }, -- Required
        --
        -- { 'hrsh7th/cmp-buffer' },
        -- { 'hrsh7th/cmp-path' },
        -- { 'hrsh7th/cmp-cmdline' },
        --

        { 'L3MON4D3/LuaSnip' }, -- Required
        { 'saghen/blink.cmp' }
    },
    config = function()
        local lsp = require('lsp-zero')

        lsp.extend_lspconfig({
            sign_text = true,
            float_border = "single"
        })
        -- Reserve a space in the gutter
        -- This will avoid an annoying layout shift in the screen
        vim.opt.signcolumn = 'yes'
        

        -- Add cmp_nvim_lsp capabilities settings to lspconfig
        -- This should be executed before you configure any language server
        -- local lspconfig_defaults = require('lspconfig').util.default_config
        -- lspconfig_defaults.capabilities = vim.tbl_deep_extend(
        --     'force',
        --     lspconfig_defaults.capabilities,
        --     require('cmp_nvim_lsp').default_capabilities()
        -- )

        -- Set up lspconfig.
        --local capabilities = require('cmp_nvim_lsp').default_capabilities()
        local capabilities = require('blink.cmp').get_lsp_capabilities()
        -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
        vim.lsp.config('basedpyright',{
            capabilities = capabilities
        })
        -- local lspkind = require("lspkind")
        -- local cmp = require("cmp")
        -- local util = require 'lspconfig.util'
        --
        --
        --
        -- cmp.setup({
        --     preselect = false,
        --
        --     formatting = {
        --         --[[
        --         format = lspkind.cmp_format({
        --             mode = 'symbol', -- show only symbol annotations
        --             maxwidth = {
        --                 -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
        --                 -- can also be a function to dynamically calculate max width such as
        --                 -- menu = function() return math.floor(0.45 * vim.o.columns) end,
        --                 menu = 50,            -- leading text (labelDetails)
        --                 abbr = 50,            -- actual suggestion item
        --             },
        --             ellipsis_char = '...',    -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
        --             show_labelDetails = true, -- show labelDetails in menu. Disabled by default
        --
        --             -- The function below will be called before any actual modifications from lspkind
        --             -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
        --             before = function(entry, vim_item)
        --                 -- ...
        --                 return vim_item
        --             end
        --         })
        --     ]]--
        --     },
        --     window = {
        --         completion = cmp.config.window.bordered(),
        --         documentation = cmp.config.window.bordered(),
        --     },
        --     mapping = cmp.mapping.preset.insert({
        --         ["C-<CR>"] = cmp.mapping.confirm({ select = true }),
        --         ["C-Enter"] = cmp.mapping.confirm({ select = true }),
        --         ["<Tab>"] = cmp.mapping.confirm({ select = true })
        --
        --     }),
        --     sources = cmp.config.sources({
        --         { name = 'nvim_lsp' },
        --         -- { name = 'vsnip' }, -- For vsnip users.
        --         -- { name = 'luasnip' }, -- For luasnip users.
        --         -- { name = 'ultisnips' }, -- For ultisnips users.
        --         -- { name = 'snippy' }, -- For snippy users.
        --     }, {
        --             { name = 'buffer' },
        --         })
        -- })
        -- -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        -- cmp.setup.cmdline({ '/', '?' }, {
        --     mapping = cmp.mapping.preset.cmdline(),
        --     sources = {
        --         { name = 'buffer' }
        --     }
        -- })
        --
        -- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        -- cmp.setup.cmdline(':', {
        --     mapping = cmp.mapping.preset.cmdline(),
        --     sources = cmp.config.sources({
        --         { name = 'path' }
        --     }, {
        --             { name = 'cmdline' }
        --         })
        -- })
        --

        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = { 'lua_ls', 'rust_analyzer', },
            handlers = {
                function(server_name)
                    vim.lsp.config(server_name,{})
                end,
                --lua_ls = function()
                --require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
                --end,
                lua_ls = function()
                    require 'lspconfig'.lua_ls.setup {
                        on_init = function(client)
                            if client.workspace_folders then
                                local path = client.workspace_folders[1].name
                                if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
                                    return
                                end
                            end

                            client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                                runtime = {
                                    -- Tell the language server which version of Lua you're using
                                    -- (most likely LuaJIT in the case of Neovim)
                                    version = 'LuaJIT'
                                },
                                -- Make the server aware of Neovim runtime files
                                workspace = {
                                    checkThirdParty = false,
                                    library = {
                                        vim.env.VIMRUNTIME
                                        -- Depending on the usage, you might want to add additional paths here.
                                        -- "${3rd}/luv/library"
                                        -- "${3rd}/busted/library",
                                    }
                                    -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
                                    -- library = vim.api.nvim_get_runtime_file("", true)
                                }
                            })
                        end,
                        settings = {
                            Lua = {}
                        }
                    }
                end,
                rust_analyzer = function()
                        vim.lsp.config('.rust_analyzer',{
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
                                diagnostic = {
                                    refreshSupport = false,
                                },
                                completion = {
                                    addSemicolonToUnit = true
                                }
                            },
                        },
                    })
                end,
                basedpyright = function()
                    require("lspconfig").basedpyright.setup {
                        settings = {
                            basedpyright = {
                                analysis = {
                                    diagnosticMode = "openFilesOnly",
                                    inlayHints = {
                                        callArgumentNames = true
                                    }
                                }
                            }
                        }
                    }
                end,
                omnisharp = function()
                    require("lspconfig").omnisharp.setup {
                        capabilities = capabilities,
                        handlers = {
                            ["textDocument/semanticTokens/full"] = function() return nil end
                        },
                        settings = {
                            FormattingOptions = {
                                -- Enables support for reading code style, naming convention and analyzer
                                -- settings from .editorconfig.
                                EnableEditorConfigSupport = true,
                                -- Specifies whether 'using' directives should be grouped and sorted during
                                -- document formatting.
                                OrganizeImports = true,
                            },
                            MsBuild = {
                                -- If true, MSBuild project system will only load projects for files that
                                -- were opened in the editor. This setting is useful for big C# codebases
                                -- and allows for faster initialization of code navigation features only
                                -- for projects that are relevant to code that is being edited. With this
                                -- setting enabled OmniSharp may load fewer projects and may thus display
                                -- incomplete reference lists for symbols.
                                LoadProjectsOnDemand = nil,
                            },
                            RoslynExtensionsOptions = {
                                -- Enables support for roslyn analyzers, code fixes and rulesets.
                                EnableAnalyzersSupport = true,
                                -- Enables support for showing unimported types and unimported extension
                                -- methods in completion lists. When committed, the appropriate using
                                -- directive will be added at the top of the current file. This option can
                                -- have a negative impact on initial completion responsiveness,
                                -- particularly for the first few completion sessions after opening a
                                -- solution.
                                EnableImportCompletion = nil,
                                -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
                                -- true
                                AnalyzeOpenDocumentsOnly = true,
                            },
                            Sdk = {
                                -- Specifies whether to include preview versions of the .NET SDK when
                                -- determining which version to use for project loading.
                                IncludePrereleases = true,
                            },
                        },

                        filetypes = { 'cs', 'vb' },
                        root_dir = util.root_pattern('*.sln', '*.csproj', 'omnisharp.json', 'function.json'),
                        on_new_config = function(new_config, _)
                            -- Get the initially configured value of `cmd`
                            new_config.cmd = { unpack(new_config.cmd or {}) }

                            -- Append hard-coded command arguments
                            table.insert(new_config.cmd, '-z') -- https://github.com/OmniSharp/omnisharp-vscode/pull/4300
                            vim.list_extend(new_config.cmd, { '--hostPID', tostring(vim.fn.getpid()) })
                            table.insert(new_config.cmd, 'DotNet:enablePackageRestore=false')
                            vim.list_extend(new_config.cmd, { '--encoding', 'utf-8' })
                            table.insert(new_config.cmd, '--languageserver')

                            -- Append configuration-dependent command arguments
                            local function flatten(tbl)
                                local ret = {}
                                for k, v in pairs(tbl) do
                                    if type(v) == 'table' then
                                        for _, pair in ipairs(flatten(v)) do
                                            ret[#ret + 1] = k .. ':' .. pair
                                        end
                                    else
                                        ret[#ret + 1] = k .. '=' .. vim.inspect(v)
                                    end
                                end
                                return ret
                            end
                            if new_config.settings then
                                vim.list_extend(new_config.cmd, flatten(new_config.settings))
                            end

                            -- Disable the handling of multiple workspaces in a single instance
                            new_config.capabilities = vim.deepcopy(new_config.capabilities)
                            new_config.capabilities.workspace.workspaceFolders = false -- https://github.com/OmniSharp/omnisharp-roslyn/issues/909
                        end,
                        init_options = {},
                    }
                end,
                angularls = function()

                    require("lspconfig").angularls.setup{
                        cmd = { "ngserver", "--stdio" },
                        filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx" },
                        root_dir = require("lspconfig").util.root_pattern("angular.json", "package.json"),
                        settings = {
                            angular = {
                                enableTypeScript = true,
                                templateLanguageService = {
                                    enable = true,
                                },
                            }
                        }
                    }
                end



            }
        })
        lsp.format_on_save({
            format_opts = {
                async = false,
                timeout_ms = 10000,
            },
            servers = {
                --['lua_ls'] = { 'lua' },
                ['rust_analyzer'] = { 'rust' },
                --['omnisharp'] = { 'c_sharp' },
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
        for _, method in ipairs({ 'textDocument/diagnostic', 'workspace/diagnostic' }) do
            local default_diagnostic_handler = vim.lsp.handlers[method]
            vim.lsp.handlers[method] = function(err, result, context, config)
                if err ~= nil and err.code == -32802 then
                    return
                end
                return default_diagnostic_handler(err, result, context, config)
            end
        end
    end,

}
