return {
  "hrsh7th/nvim-cmp",
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local cmp = require("cmp")
    
    -- Add mappings
    opts.mapping = vim.tbl_extend("force", opts.mapping or {}, {
      ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      -- Jump to next/previous variable
      ["<C-v>"] = cmp.mapping(function(fallback)
        local entries = cmp.get_entries()
        for i, entry in ipairs(entries) do
          if entry.kind == cmp.lsp.CompletionItemKind.Variable then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select, count = i })
            return
          end
        end
        fallback()
      end),
      ["<C-S-v>"] = cmp.mapping(function(fallback)
        local entries = cmp.get_entries()
        for i = #entries, 1, -1 do
          if entries[i].kind == cmp.lsp.CompletionItemKind.Variable then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select, count = #entries - i + 1 })
            return
          end
        end
        fallback()
      end),
    })
    
    opts.sorting = {
      priority_weight = 2,
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
