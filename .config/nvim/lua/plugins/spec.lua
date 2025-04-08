return {
    -- Packer can manage itself
    --'wbthomason/packer.nvim'
    {
        'nvim-telescope/telescope.nvim',
        version = "0.1.8",
        dependencies = { 'nvim-lua/plenary.nvim' }
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
    { 'hrsh7th/cmp-cmdline' },
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
            { 'williamboman/mason.nvim' },
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
    { 'christoomey/vim-tmux-navigator' },
    { "github/copilot.vim",
        enabled = false
    },
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
    { "ray-x/lsp_signature.nvim" },
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
}
