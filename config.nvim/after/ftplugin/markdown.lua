vim.g.localleader = "\\"

vim.api.nvim_create_autocmd(
    {"BufEnter" , "BufWinEnter"},
    {
        pattern = "*.md",
        callback = function()
            require("lazy").load({plugins = {"vim-table-mode"}})
            vim.cmd("TableModeToggle")
        end
    }
)
