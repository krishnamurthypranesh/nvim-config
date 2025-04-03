-- quick formatting of code
-- function FormatBasedOnFileType()
--   local cmd = ""
--   if (vim.b.filtype == "python")
--     then cmd = "
-- end
vim.keymap.set("n", "<leader>lj", ":%!jq<cr>", { desc = "format json files" })

