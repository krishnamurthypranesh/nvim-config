return {
    {
        "rose-pine/neovim",
        config = function()
        end
    },
    {
        "folke/tokyonight.nvim",
        opts = {
            transparent=true,
            sidebars = 'light',
            floats = 'dark',
        },
    },
    {
        "rebelot/kanagawa.nvim",
        config=function()
            require("kanagawa").setup({
                transparent=true,
            })
        end
    },
}
