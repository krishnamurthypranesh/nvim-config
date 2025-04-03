local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fw', builtin.live_grep, { desc = 'Telescope live grep' })

vim.keymap.set(
  'n',
  '<leader>sb',
  function()
    builtin.grep_string(
      search = vim.fn.input("Grep (backend) >"),
      cwd = "/home/pranesh/tlg/landler/platform/backend",
    )
  end
)
