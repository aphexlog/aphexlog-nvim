return {
  "hrsh7th/nvim-cmp",
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local cmp = require("cmp")
    opts.sorting = {
      priority_weight = 1,
      comparators = {
        function(entry1, entry2)
          -- Give higher priority to variables
          local kind_priority = {
            Variable = 1, -- Assign highest priority to variables
            Function = 2,
            Method = 3,
            Field = 4,
            Class = 5,
            Interface = 6,
            Module = 7,
          }

          local kind1 = kind_priority[entry1:get_kind()] or 100
          local kind2 = kind_priority[entry2:get_kind()] or 100
          if kind1 ~= kind2 then
            return kind1 < kind2
          end
        end,
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
