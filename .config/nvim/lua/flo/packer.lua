-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use({
        "catppuccin/nvim",
        as = "catppuccin",
        vim.cmd('colorscheme catppuccin')
    })
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('ThePrimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {                            -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
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
    }
    use { 'christoomey/vim-tmux-navigator' }
    use("github/copilot.vim")
    use "nvim-neotest/nvim-nio"
    use 'mfussenegger/nvim-dap'
    use "mfussenegger/nvim-dap-python"
    use "mfussenegger/nvim-lint"
    use "mhartington/formatter.nvim"
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
    use { 'Weissle/persistent-breakpoints.nvim' }

    use { "jay-babu/mason-nvim-dap.nvim" }

    use { "nvim-lua/plenary.nvim" }
    use { "Shatur/neovim-tasks" }
    use { "ray-x/lsp_signature.nvim" }
    use { "mikavilpas/yazi.nvim",
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
end
)
