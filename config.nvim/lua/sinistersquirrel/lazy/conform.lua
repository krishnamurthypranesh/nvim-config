return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				html = {
					"prettier",
                    "htmlbeautifier",
				},
				htmldjango = {
					"djlint",
				},
				elm = {
					"elm-format",
				},
                javascript = {
                    "biome",
                    "eslint_d",
                },
                sql={
                    "sqlfmt",
                }
			},
		})
	end,
}
