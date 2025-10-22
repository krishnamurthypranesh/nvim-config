return {
	"williamboman/mason-lspconfig.nvim",
	opts = {},
	config = function()
		require("mason").setup({})
		require("mason-lspconfig").setup()
	end,
}
