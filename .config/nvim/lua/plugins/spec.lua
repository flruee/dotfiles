return {
    -- Packer can manage itself
    --'wbthomason/packer.nvim'
    {
        'nvim-telescope/telescope.nvim',
        version = "0.1.8",
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('telescope').setup {
                defaults = {
                    file_ignore_patterns = { '%__virtual.cs$' },
                },
            }
        end
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000
    },
    { 'ThePrimeagen/harpoon' },
    { 'mbbill/undotree' },
    { 'tpope/vim-fugitive' },
    --{ 'neovim/nvim-lspconfig' },
    --[[
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    ]] --
    --{ 'williamboman/mason.nvim' },
    --{ 'williamboman/mason-lspconfig.nvim' }, -- Optional
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp"
    },
    {
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
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required

            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-cmdline' },


            { 'L3MON4D3/LuaSnip' }, -- Required
        }
    },
    {
        "seblyng/roslyn.nvim",
        ft = "cs",
        dependencies = {
            {
                -- By loading as a dependencies, we ensure that we are available to set
                -- the handlers for roslyn
                'tris203/rzls.nvim',
                config = function()
                    ---@diagnostic disable-next-line: missing-fields
                    require('rzls').setup {}
                end,
            },
        },
        -- ---@module 'roslyn.config'
        -- ---@type RoslynNvimConfig
        --opts = {
        --   config = {
        config = function()
            require('roslyn').setup {
                args = {
                    '--stdio',
                    '--logLevel=Information',
                    '--extensionLogDirectory=' .. vim.fs.dirname(vim.lsp.get_log_path()),
                    '--razorSourceGenerator='
                        .. vim.fs.joinpath(vim.fn.stdpath 'data' --[[@as string]], 'mason', 'packages', 'roslyn', 'libexec', 'Microsoft.CodeAnalysis.Razor.Compiler.dll'),
                    '--razorDesignTimePath=' .. vim.fs.joinpath(
                        vim.fn.stdpath 'data' --[[@as string]],
                        'mason',
                        'packages',
                        'rzls',
                        'libexec',
                        'Targets',
                        'Microsoft.NET.Sdk.Razor.DesignTime.targets'
                    ),
                },
                config = {
                    handlers = require 'rzls.roslyn_handlers',
                    settings = {
                        ["csharp|background_analysis"] = {
                            background_analysis = {
                                dotnet_analyzer_diagnostics_scope = "fullSolution",
                                dotnet_compiler_diagnostics_scope = "fullSolution",
                            }
                        },
                        ["csharp|inlay_hints"] = {
                            csharp_enable_inlay_hints_for_implicit_object_creation = true,
                            csharp_enable_inlay_hints_for_implicit_variable_types = true,
                            csharp_enable_inlay_hints_for_lambda_parameter_types = true,
                            csharp_enable_inlay_hints_for_types = true,
                            dotnet_enable_inlay_hints_for_indexer_parameters = true,
                            dotnet_enable_inlay_hints_for_literal_parameters = true,
                            dotnet_enable_inlay_hints_for_object_creation_parameters = true,
                            dotnet_enable_inlay_hints_for_other_parameters = true,
                            dotnet_enable_inlay_hints_for_parameters = true,
                            dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
                            dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
                            dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
                        },
                        ["csharp|code_lens"] = {
                            dotnet_enable_references_code_lens = true,
                        },
                    },
                    --},
                    --filewatching = 'roslyn',
                }
            }
            --},
        end,
        init = function()
            -- we add the razor filetypes before the plugin loads
            vim.filetype.add {
                extension = {
                    razor = 'razor',
                    cshtml = 'razor',
                },
            }
        end,

    },
    { 'christoomey/vim-tmux-navigator' },
    --[[
    { "github/copilot.vim",
        enabled = false
    },
    ]]--
    { "nvim-neotest/nvim-nio" },
    { 'mfussenegger/nvim-dap' },
    { "mfussenegger/nvim-dap-python" },
    { "mfussenegger/nvim-lint" },
    { "mhartington/formatter.nvim" },
    { "rcarriga/nvim-dap-ui",               dependencies = { "mfussenegger/nvim-dap" } },
    { 'Weissle/persistent-breakpoints.nvim' },
    { "jay-babu/mason-nvim-dap.nvim" },

    { "nvim-lua/plenary.nvim" },
    { "Shatur/neovim-tasks" },
    --{ "ray-x/lsp_signature.nvim" },
    {
        "mikavilpas/yazi.nvim",
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    -- { "tpope/vim-surround" },
    -- 'm4xshen/autoclose.nvim',
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        --after = "nvim-treesitter",
        dependencies = "nvim-treesitter/nvim-treesitter",
    },
    {

        'jmbuhr/otter.nvim',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
        },
        opts = {},
    },
    { '3rd/image.nvim',
        enabled = false,
        config = {
		--[[
            require("image").setup({
                backend = "kitty",
                processor = "magick_cli", -- or "magick_cli"
                integrations = {
                    markdown = {
                        enabled = true,
                        clear_in_insert_mode = false,
                        download_remote_images = true,
                        only_render_image_at_cursor = false,
                        floating_windows = true,               -- if true, images will be rendered in floating markdown windows
                        filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
                    },
                    neorg = {
                        enabled = true,
                        filetypes = { "norg" },
                    },
                    typst = {
                        enabled = true,
                        filetypes = { "typst" },
                    },
                    html = {
                        enabled = false,
                    },
                    css = {
                        enabled = false,
                    },
                },
                max_width = 100,
                max_height = 12,
                max_width_window_percentage = math.huge,
                max_height_window_percentage = math.huge,
                window_overlap_clear_enabled = true,                                                -- toggles images when windows are overlapped
                window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "snacks_notif", "scrollview", "scrollview_sign" },
                editor_only_render_when_focused = false,                                            -- auto show/hide images when the editor gains/looses focus
                tmux_show_only_in_active_window = false,                                            -- auto show/hide images in the correct Tmux window (needs visual-activity off)
                hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
            })
	    --]]
        }

    },
    { 'GCBallesteros/jupytext.nvim' },
    {
        "nvimtools/hydra.nvim",
    },
    { 'benlubas/molten-nvim' },
    {
        'quarto-dev/quarto-nvim',
        dependencies = {
            'jmbuhr/otter.nvim',
            'nvim-treesitter/nvim-treesitter'
        }
    },
    { 'mfussenegger/nvim-jdtls'},
    {
        "nvzone/typr",
        dependencies = "nvzone/volt",
        opts = {},
        cmd = { "Typr", "TyprStats" },
        {
            "rachartier/tiny-inline-diagnostic.nvim",
            event = "VeryLazy",
            priority = 1000,
            config = function()
                require('tiny-inline-diagnostic').setup()
                vim.diagnostic.config({ virtual_text = false }) -- Disable default virtual text
            end
        }
    },
}
