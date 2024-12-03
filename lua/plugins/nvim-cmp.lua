local lspkind_comparator = function(conf)
  local lsp_types = require("cmp.types").lsp
  return function(entry1, entry2)
    if entry1.source.name ~= "nvim_lsp" then
      if entry2.source.name == "nvim_lsp" then
        return false
      else
        return nil
      end
    end
    local kind1 = lsp_types.CompletionItemKind[entry1:get_kind()]
    local kind2 = lsp_types.CompletionItemKind[entry2:get_kind()]
    if kind1 == "Variable" and entry1:get_completion_item().label:match("%w*=") then
      kind1 = "Parameter"
    end
    if kind2 == "Variable" and entry2:get_completion_item().label:match("%w*=") then
      kind2 = "Parameter"
    end

    local priority1 = conf.kind_priority[kind1] or 0
    local priority2 = conf.kind_priority[kind2] or 0
    if priority1 == priority2 then
      return nil
    end
    return priority1 > priority2
  end
end

local label_comparator = function(entry1, entry2)
  return entry1.completion_item.label < entry2.completion_item.label
end

return {
  "hrsh7th/nvim-cmp",
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local cmp = require("cmp")
    opts.sorting = {
      priority_weight = 1,
      comparators = {
        cmp.config.compare.offset,
        cmp.config.compare.exact,
        cmp.config.compare.score,
        cmp.config.compare.kind,
        cmp.config.compare.sort_text,
        cmp.config.compare.length,
        cmp.config.compare.order,

        lspkind_comparator({
          kind_priority = {
            Variable = 100,    -- Significantly higher priority for variables
            Parameter = 90,
            Field = 80,
            Property = 80,
            Constant = 70,
            Enum = 70,
            EnumMember = 70,
            Event = 60,
            Function = 60,
            Method = 60,
            Operator = 50,
            Reference = 50,
            Struct = 40,
            File = 30,
            Folder = 30,
            Class = 20,
            Color = 20,
            Module = 20,
            Keyword = 10,
            Constructor = 5,
            Interface = 5,
            Snippet = 0,
            Text = 0,
            TypeParameter = 0,
            Unit = 0,
            Value = 0,
          },
        }),
        label_comparator,
      },
    }

    return opts
  end,
}
