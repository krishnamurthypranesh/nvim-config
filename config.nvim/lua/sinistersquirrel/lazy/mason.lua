return {
	"williamboman/mason.nvim",
	config = function()
		require("mason").setup()
	end,
	opts = {
		ensure_installed = {
			"lua-language-server",
			"stylua",
			"html-lsp",
			"css-lsp",
			"prettier",
			"pyright",
		},
	},
}
