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
    { "github/copilot.vim" },
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
    { '3rd/image.nvim' },
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
