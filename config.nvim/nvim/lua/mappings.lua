vim.keymap.set("n", ";", ":", { desc = "CMD enter command mode" })

vim.keymap.set("n", "<leader>n", vim.cmd.Ex)

-- terminals
vim.keymap.set("n", "<leader>h", ":belowright split +term<cr>")
vim.keymap.set("n", "<leader>v", ":belowright vsplit +term<cr>")
vim.keymap.set("t", "<C-X>", "<C-\\><C-N>")
vim.keymap.set("n", "<M-i>", ":Floaterminal<cr>")

-- windows
--- navigation
vim.keymap.set("n","<C-k>" , "<c-w>k")
vim.keymap.set("n","<C-j>" , "<c-w>j")
vim.keymap.set("n","<C-h>" , "<c-w>h")
vim.keymap.set("n","<C-l>" , "<c-w>l")

--- resizing splits
vim.keymap.set("n", "=", [[<cmd>vertical resize +5<cr>]]) -- make the window biger vertically
vim.keymap.set("n", "-", [[<cmd>vertical resize -5<cr>]]) -- make the window smaller vertically
vim.keymap.set("n", "+", [[<cmd>horizontal resize +2<cr>]]) -- make the window bigger horizontally by pressing shift and =
vim.keymap.set("n", "_", [[<cmd>horizontal resize -2<cr>]]) -- make the window smaller horizontally by pressing shift and -


--- buffers
vim.keymap.set("n", "<leader>bx", ":bd<cr>")


-- folding
local ufo = require("ufo")
vim.keymap.set("n", "zM", ufo.closeAllFolds)
vim.keymap.set("n", "zR", ufo.openAllFolds)


-- fugitive
vim.keymap.set("n", "<leader>gB", ":Git blame<cr>")
vim.keymap.set("n", "<leader>g", ":Git<cr>")


-- nvim-tree
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<cr>")


-- dap
vim.keymap.set("n", "<leader>db", ":DapToggleBreakpoint<cr>")
vim.keymap.set("n", "<leader>dc", ":DapContinue<cr>")


