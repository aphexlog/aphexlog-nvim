return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", -- LSP suggestions
    "L3MON4D3/LuaSnip", -- Snippet engine
    "saadparwaiz1/cmp_luasnip", -- Snippet adapter
  },
  ---@param opts table
  opts = function(_, opts)
    local cmp = require("cmp")

    -- Disable automatic completion
    opts.completion = {
      autocomplete = false,
    }

    -- Define key mappings
    opts.mapping = vim.tbl_deep_extend("force", opts.mapping, {
      ["<C-Space>"] = cmp.mapping.complete(), -- Trigger completion menu
      ["<C-y>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection
      ["<CR>"] = cmp.config.disable, -- Disable Enter key for confirmation
    })

    -- Set up sorting priorities
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

    -- Define completion sources
    opts.sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "path" },
    })

    return opts
  end,
}
