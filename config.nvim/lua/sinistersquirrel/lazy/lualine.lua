return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config=function()
        require('lualine').setup({
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {'filname'},
                lualine_x = { 'filetype', 'fileformat', 'encoding'},
                lualine_y = {'progress'},
                lualine_z = {'location'},
            },
        })
    end,
}
