require("sinistersquirrel.set")
require("sinistersquirrel.workflow")
require("sinistersquirrel.floaterminal")

require("sinistersquirrel.lazy_init")


function SetEditorColor(color)
  color = color or "rose-pine"
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

SetEditorColor("kanagawa-dragon")
