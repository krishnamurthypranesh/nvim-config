return {
    "nvim-neorg/neorg",
    lazy = false,
    version = "v9.3.0",
    config = function()
        require("neorg").setup {
            load = {
                ["core.defaults"] = {},
                ["core.concealer"] = {},
                ["core.dirman"] = {
                    config = {
                        workspaces = {
                            notes = "~/notes",
                        },
                        default_workspace = "notes",
                    }
                },
                ["core.qol.toc"] = {
                    config = {
                        auto_toc = {
                            enter = false,
                            open = false
                        }
                    }
                },
            }
        }
        vim.keymap.set("n", "<leader>Ni", ":Neorg index<cr>")
        vim.keymap.set("n", "<leader>Nt", ":Neorg journal today<cr>")
        vim.keymap.set("n", "<leader>Nr", ":Neorg return<cr>")
    end,
    run = ":Neorg sync-parsers",
    dependencies = {
        "nvim-lua/plenary.nvim",
    }
}
