--[[
require 'nvim-treesitter.configs'.setup({
    -- A list of parser names, or "all" (the five listed parsers should aays be installed)
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python", "javascript" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,



    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true
    },
    textobjects = {
        move = {
            enable = true,
            set_jumps = false,
            goto_next_start = {
                ["]b"] = { query = "@code_cell.inner", desc = "next code block" },
            },
            goto_previous_start = {
                ["[b"] = { query = "@code_cell.inner", desc = "previous code block" },
            },
        },
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["af"] = { query = "@function.outer", desc = "around function" },
                ["if"] = { query = "@function.inner", desc = "in function" },
                ["ac"] = { query = "@class.outer", desc = "around class" },
                ["ic"] = { query = "@class.inner", desc = "in class" },
                ["ik"] = { query = "@assignment.lhs", desc = "in key" },
                ["iv"] = { query = "@assignment.rhs", desc = "in value" },
                ["i/"] = { query = "@regex.inner", desc = "in regex" },
                ["a/"] = { query = "@regex.outer", desc = "around regex" },
                ["ia"] = { query = "@parameter.inner", desc = "in parameter" },
                ["aa"] = { query = "@parameter.outer", desc = "around parameter" },
                ["in"] = { query = "@number.inner", desc = "in number" },
                ["ib"] = { query = "@code_cell.inner", desc = "in block" },
                ["ab"] = { query = "@code_cell.outer", desc = "around block" },
            },
        },
    }
})
]]--
