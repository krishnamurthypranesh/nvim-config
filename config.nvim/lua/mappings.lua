vim.keymap.set("n", ";", ":", { desc = "CMD enter command mode" })

vim.keymap.set("n", "<leader>n", vim.cmd.Ex)

-- terminals
vim.keymap.set("n", "<leader>h", ":belowright split +term<cr>")
vim.keymap.set("n", "<leader>v", ":belowright vsplit +term<cr>")
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-N>")

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


-- folding
local ufo = require("ufo")
vim.keymap.set("n", "zM", ufo.closeAllFolds)
vim.keymap.set("n", "zR", ufo.openAllFolds)


-- telescope mappings
local telescope_builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', telescope_builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fw', telescope_builtin.live_grep, { desc = 'Telescope live grep' })

vim.keymap.set(
  'n',
  '<leader>sb',
  function()
    telescope_builtin.grep_string({
      search = vim.fn.input("Grep (backend) >"),
      cwd = "/home/pranesh/tlg/landler/platform/backend",
    })
  end
)

vim.keymap.set("n", "<leader>fb", telescope_builtin.buffers, { desc = "Telescope find buffers" })

-- fugitive
vim.keymap.set("n", "<leader>gB", ":Git blame<cr>")
vim.keymap.set("n", "<leader>g", ":Git<cr>")

-- undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- neorg
vim.keymap.set("n", "<leader>Ni", ":Neorg index<cr>")
vim.keymap.set("n", "<leader>Nt", ":Neorg journal today<cr>")
vim.keymap.set("n", "<leader>Nr", ":Neorg return<cr>")

-- nvim-tree
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<cr>")


