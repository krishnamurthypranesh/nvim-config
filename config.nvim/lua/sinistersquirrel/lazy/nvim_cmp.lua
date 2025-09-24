return {
    "hrsh7th/nvim-cmp",
    config=function()
        local cmp = require("cmp")
        local cmp_select = {behavior = cmp.SelectBehavior.Select}
        local t = {
          sources = cmp.config.sources({
            {name = 'nvim_lsp'},  
            {name = 'luasnip'},  
          }, {
            {name = 'buffer'},
          }),
          mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.select_prev_item(cmp_select),
            ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
            ['<cr>'] = cmp.mapping.confirm({select = true}),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping({
              i = cmp.mapping.abort(),
              c = cmp.mapping.close(),
            }),
          }),
          snippet = {
            expand = function(args)
              require('luasnip').lsp_expand(args.body)
            end,
          },
        }
        cmp.setup(t)
    end,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer"
    }
}
