return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", -- use suggestions from the LSP

    -- Snippet engine. Required for nvim-cmp to work, even if you don't
    -- intend to use custom snippets.
    "L3MON4D3/LuaSnip", -- snippet engine
    "saadparwaiz1/cmp_luasnip", -- adapter for the snippet engine
  },
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local cmp = require("cmp")
    opts.mapping = vim.tbl_deep_extend("force", opts.mapping, {
      ["<C-y>"] = cmp.mapping.confirm({ select = true }),
      ["<CR>"] = cmp.config.disable,
    })
    opts.sorting = {
      priority_weight = 100,
      comparators = {
        cmp.config.compare.offset,
        cmp.config.compare.exact,
        cmp.config.compare.score,
        cmp.config.compare.kind,
        cmp.config.compare.sort_text,
        cmp.config.compare.length,
        cmp.config.compare.order,
      },
    }

    return opts
  end,
}
