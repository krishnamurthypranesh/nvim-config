vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


vim.g.python3_host_prog = '/home/pranesh/.pyenv/versions/3.11.8/envs/py3nvim'


-- use the system clipboard
-- vim.api.nvim_set_option("clipboard", "unnamed")
vim.opt.clipboard = "unnamedplus"


vim.schedule(function()
  require('mappings')
end)


local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

-- Auto-install lazy.nvim if not present
if not vim.uv.fs_stat(lazypath) then
  print('Installing lazy.nvim....')
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
  print('Done.')
end

vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
  spec = {
    {
      "nvim-telescope/telescope.nvim",
      opts = {},
    },
    {
      "tpope/vim-fugitive",
      config = function()
      end
    },
    {
        "kdheepak/lazygit.nvim",
        lazy = true,
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        -- setting the keybinding for LazyGit with 'keys' is recommended in
        -- order to load the plugin when the command is run for the first time
        keys = {
            { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
        }
    },
    {
      "rose-pine/neovim",
      config = function()
      end
    },
    { 'projekt0n/github-nvim-theme', name = 'github-theme' },
    {
        "rebelot/kanagawa.nvim",
    },
    {
        "EdenEast/nightfox.nvim",
    },
    {
      "nvim-treesitter/nvim-treesitter",
      lazy = false,
      build = ":TSUpdate",
      opts = {
        ensure_installed = { "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "norg", "python", "go", "javascript", "rust"},
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        }
      },
      config = function(_, opts)
	require("nvim-treesitter.configs").setup(opts)
      end
    },
    {
      "mbbill/undotree",
      config = function()
      end
    },
    {
        "nvim-neorg/neorg",
        lazy = false,
        version = "v9.3.0",
        config = function()
            require("neorg").setup {
            load = {
                ["core.defaults"] = {},
                ["core.concealer"] = {},
                ["core.dirman"] = {
                    config = {
                        workspaces = {
                            notes = "~/notes",
                        },
                        default_workspace = "notes",
                    }
	            },
                ["core.qol.toc"] = {
                    config = {
                        auto_toc = {
                            close = true,
                            enter = true,
                            exit_nvim = true,
                            open = true
                        }
                    }
                }
	        }
        }
        end,
        run = ":Neorg sync-parsers",
        dependencies = {
            "nvim-lua/plenary.nvim",
        }
    },
    {
        "williamboman/mason.nvim",
        config=function()
            require("mason").setup()
        end,
        opts = {
            ensure_installed = {
                "lua-language-server", "stylua",
                "html-lsp", "css-lsp", "prettier",
                "pyright"
            }
        }
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config=function()
        end
    },
    {
        "neovim/nvim-lspconfig",
        config=function()
        end
    },
    {
        "L3MON4D3/LuaSnip",
        config=function()
        end
    },
    {
        "hrsh7th/nvim-cmp",
        config=function()
        end,
        dependencies = {
          "hrsh7th/cmp-nvim-lsp",
          "hrsh7th/cmp-buffer"
        }
    },
    {
        "saadparwaiz1/cmp_luasnip",
        config=function()
        end
    },
    {
        "rafamadriz/friendly-snippets",
        config=function()
        end
    },
    {
        "kevinhwang91/nvim-ufo",
        config=function()
          vim.o.foldcolumn = "0"
          vim.o.foldlevel = 99
          vim.o.foldlevelstart = 99
          vim.o.foldenable = true
          vim.o.foldnestmax = 4

          require('ufo').setup({
            provider_selector = function(bufnr, filetype, buftype)
              return {'treesitter', 'indent'}
            end
          })
        end,
        dependencies={
          'kevinhwang91/promise-async'
        }
    },
    {
      "nvim-tree/nvim-tree.lua",
      config = function()
	require("nvim-tree").setup({
	  sort = {
	    sorter = "case_sensitive",
	  },
	  view = {
	    width = 30,
	  },
	  renderer = {
	    group_empty = true
	  },
	  filters = {
	    dotfiles = false,
	    git_ignored = false,
	  },
	  update_focused_file = {
	    enable = true,
	    update_cwd = false,
	  },
	})
      end
    },
    {
      "mfussenegger/nvim-dap-python",
    },
  },
  checker = { enabled = true }
})


require("sinistersquirrel")


-- move this to a separate file maybe under plugins or config
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('user_lsp_attach', {clear = true}),
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
    vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
  end,
})

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'ts_ls', 'rust_analyzer', 'pyright', 'tflint', 'terraformls'},
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({
        capabilities = lsp_capabilities,
      })
    end,
    lua_ls = function()
      require('lspconfig').lua_ls.setup({
        capabilities = lsp_capabilities,
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT'
            },
            diagnostics = {
              globals = {'vim'},
            },
            workspace = {
              library = {
                vim.env.VIMRUNTIME,
              }
            }
          }
        }
      })
    end,
  }
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
  sources = cmp.config.sources({
    {name = 'nvim_lsp'},  
    {name = 'luasnip'},  
  }, {
    {name = 'buffer'},
  }),
  mapping = cmp.mapping.preset.insert({
    ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
    ['<cr>'] = cmp.mapping.confirm({select = true}),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})
