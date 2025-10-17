vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- change this to be read from an environment variable
local function set_python3_host_from_env(env_var_name, fallback)
  local env_value = vim.fn.getenv(env_var_name)
  
  if env_value ~= vim.NIL and env_value ~= '' then
    vim.g.python3_host_prog = env_value
  elseif fallback then
    vim.g.python3_host_prog = fallback
  end
end

-- Usage examples:
set_python3_host_from_env('NVIM_PYTHON3_HOST_PROG')

-- use the system clipboard
-- vim.api.nvim_set_option("clipboard", "unnamed")
vim.opt.clipboard = "unnamedplus"

vim.schedule(function()
	require("mappings")
end)

require("sinistersquirrel")
require("plugins")

local function load_project_config()
	local config_path = os.getenv("NVIM_PROJECT_CONFIG")

	if config_path and config_path ~= "" then
		if config_path:sub(1, 1) == "~" then
			config_path = vim.fn.expand(config_path)
		end
		if vim.fn.isdirectory(config_path) == 1 then
			local init_file = config_path .. "/init.lua"
			if vim.fn.filereadable(init_file) == 1 then
				dofile(init_file)
				print("loaded project config from: " .. init_file)
			else
				print("project config directory found but no init.lua: " .. config_path)
			end
		elseif vim.fn.filereadable(config_path) == 1 then
			dofile(config_path)
			print("loaded project config from: " .. config_path)
		else
			print("project config path not found: " .. config_path)
		end
	end
end

load_project_config()

-- move this to a separate file maybe under plugins or config
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("user_lsp_attach", { clear = true }),
	callback = function(event)
		local opts = { buffer = event.buf }

		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end, opts)
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end, opts)
		vim.keymap.set("n", "<leader>vws", function()
			vim.lsp.buf.workspace_symbol()
		end, opts)
		vim.keymap.set("n", "<leader>vd", function()
			vim.diagnostic.open_float()
		end, opts)
		vim.keymap.set("n", "[d", function()
			vim.diagnostic.goto_next()
		end, opts)
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.goto_prev()
		end, opts)
		vim.keymap.set("n", "<leader>vca", function()
			vim.lsp.buf.code_action()
		end, opts)
		vim.keymap.set("n", "<leader>vrr", function()
			vim.lsp.buf.references()
		end, opts)
		vim.keymap.set("n", "<leader>vrn", function()
			vim.lsp.buf.rename()
		end, opts)
		vim.keymap.set("i", "<C-h>", function()
			vim.lsp.buf.signature_help()
		end, opts)
	end,
})

local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
