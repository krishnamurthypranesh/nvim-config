local dap = require "dap"
local path = "/home/pranesh/.pyenv/versions/3.11.8/envs/landler/bin/python"

if vim.fn.has "win32" == 1 then
  path = vim.fn.stdpath "data" .. "/mason/packages/debugpy/venv/Scripts/python"
else
  path = vim.fn.stdpath "data" .. "/mason/packages/debugpy/venv/bin/python"
end

dap.adapters.python = function(cb, config)
  if config.request == "attach" then
    ---@diagnostic disable-next-line: undefined-field
    local port = (config.connect or config).port
    ---@diagnostic disable-next-line: undefined-field
    local host = (config.connect or config).host or "127.0.0.1"
    cb {
      type = "server",
      port = assert(port, "`connect.port` is required for a python `attach` configuration"),
      host = host,
      options = {
        source_filetype = "python",
      },
    }
  else
    cb {
      type = "executable",
      command = path,
      args = { "-m", "debugpy.adapter" },
      options = {
        source_filetype = "python",
      },
    }
  end
end
