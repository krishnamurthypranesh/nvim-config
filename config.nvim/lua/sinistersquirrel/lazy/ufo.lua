return {
	"kevinhwang91/nvim-ufo",
	config = function()
		require("ufo").setup({
			provider_selector = function(bufnr, filetype, buftype)
				return { "treesitter", "indent" }
			end,
		})
	end,
	dependencies = {
		"kevinhwang91/promise-async",
	},
    init=function ()
		vim.o.foldcolumn = "auto:9"
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true
		vim.o.foldnestmax = 4
		vim.o.fillchars = "eob: ,fold: ,foldopen:-,foldsep:|,foldclose:+"
    end
}
