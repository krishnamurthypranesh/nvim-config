return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
    config=function()
        vim.cmd([[do FileType]])

        -- make this configurable via an environment variable
        vim.cmd([[
            function OpenMarkdownPreview (url)
                let cmd = "brave-browser " . shellescape(a:url) . " &"
                silent call system(cmd)
            endfunction
        ]])
        -- require("markdown_preview").setup({})
        vim.g.mkdp_browserfunc = "OpenMarkdownPreview"
    end,
}
