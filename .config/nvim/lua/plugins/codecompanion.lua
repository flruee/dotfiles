return {
    "olimorris/codecompanion.nvim",
    opts = {
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require("codecompanion").setup({
            strategies = {
                -- Change the default chat adapter
                chat = {
                    adapter = "my_openai",
                },
                inline = {
                    adapter = "my_openai",
                },
                cmd = {
                    adapter = "my_openai"
                }

            },
            adapters = {
                http = {
                opts = {
                    show_defaults = false,
                },
                my_openai = function()
                    return require("codecompanion.adapters").extend("openai_compatible", {
                        env = {
                            url = "https://openai.cudos.ch", -- optional: default value is ollama url http://127.0.0.1:11434
                            api_key = "", -- optional: if your endpoint is authenticated
                            chat_url = "/api/chat/completions", -- optional: default value, override if different
                            models_endpoint = "/v1/models", -- optional: attaches to the end of the URL to form the endpoint to retrieve models
                        },
                        schema = {
                            model = {
                                default = "LiteLLM: .gemini-2.5-pro",  -- define llm model to be used
                            },
                        },
                    })
                end,
                }
            },
        })

        vim.keymap.set("n","<leader>cc","<cmd>CodeCompanionChat Toggle<CR>");
    end
}
