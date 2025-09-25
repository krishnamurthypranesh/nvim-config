vim.g.maplocalleader = "\\"
vim.keymap.set("n", "<localleader>ts", ":pu=strftime('%c')<cr>")

vim.keymap.set("n", "<localleader>tc", ":Neorg toc<cr>") 
vim.keymap.set("n", "<localleader>tt", ":Neorg toggle-todo<cr>")


local ls = require "luasnip"
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("norg", {
  s("code-block", fmt(
      [[
        @code {}
        @end
      ]],
      {
        i(1, "language"),
      }
    )
  ),
  s("h1", fmt([[ * {}]], {i(1, "title"),})),
  s("h2", fmt([[ ** {}]], {i(1, "title"),})),
  s("h3", fmt([[ *** {}]], {i(1, "title"),})),
  s("h4", fmt([[ **** {}]], {i(1, "title"),})),
  s("h5", fmt([[ ***** {}]], {i(1, "title"),})),
  s("h6", fmt([[ ****** {}]], {i(1, "title"),})),
  s("h7", fmt([[ ******* {}]], {i(1, "title"),})),
})
