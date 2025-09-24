return {
    {
        "github/copilot.vim",
        init = function()
        end,
        config = function()
            vim.g.copilot_filetypes = {
              ['*'] = true,
              norg = false,
            }
        end,
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        enabled = false,
        dependencies = {
          { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
          { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
        },
        opts = {
            mappings = {
                complete = {
                    insert = "<Tab>"
                },
                reset = {
                    normal = "<C-x>",
                    insert = "<C-x>",
                }
            }
        },
        config=function()
            require("CopilotChat").setup({})
            vim.keymap.set("n", "<leader>CC", ":CopilotChatToggle<cr>", { desc = "Toggle Copilot Chat" })
            vim.keymap.set("n", "<C-x>", ":CopilogChatReset<cr>", { desc = "Reset Copilot Chat" })
        end
    -- See Commands section for default commands if you want to lazy load on them
    },
}
