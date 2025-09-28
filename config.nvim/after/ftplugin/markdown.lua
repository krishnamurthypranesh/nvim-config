vim.g.localleader = "\\"

vim.api.nvim_create_autocmd(
    {"BufEnter" , "BufWinEnter"},
    {
        pattern = "*.md",
        callback = function()
            require("lazy").load({plugins = { "markdown-preview.nvim", "markview.nvim" }})
            -- vim.cmd("TableModeToggle")
        end
    }
)
vim.keymap.set("n", "<localleader>mp", ":MarkdownPreview<cr>")
