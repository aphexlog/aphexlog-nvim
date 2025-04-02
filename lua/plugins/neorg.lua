return {
  "nvim-neorg/neorg",
  lazy = false,
  version = "*",
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {}, -- Use "core.concealer" instead of "core.norg.concealer"
        ["core.dirman"] = {
          config = {
            workspaces = {
              notes = "~/Documents/neorg-notes/notes",
              projects = "~/Documents/neorg-notes/projects",
            },
          },
        },
      },
    })
  end,
}
