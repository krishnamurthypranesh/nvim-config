return {
  "nvim-telescope/telescope.nvim",
  opts = {},
  config = function()
      require('telescope').setup {
          defaults = {
              pickers = {
                  live_grep = {
                      addition_args = {
                          "--hidden",
                      },
                  },
              },
          },
      }

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
    vim.keymap.set("n", "<leader>fz", telescope_builtin.current_buffer_fuzzy_find, { desc = "Telescope find in current buffer" })
  end
}
