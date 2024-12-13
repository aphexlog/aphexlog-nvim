-- Lets go ahead and configure copilot for neovim, this is the copilot.lua file
return {
  "zbirenbaum/copilot.lua",

  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        hide_during_completion = true,
        debounce = 75,
        keymap = {
          accept = "<M-l>",
          accept_word = false,
          accept_line = false,
          -- next = "<M-]>",
          -- prev = "<M-[>",
          -- dismiss = "<C-]>",
        },
      },
      panel = {
        enabled = true,
        auto_refresh = true,
      },
      filetypes = {
        yaml = true,
        markdown = true,
        help = true,
        gitcommit = true,
        gitrebase = true,
        hgcommit = true,
        svn = true,
        cvs = true,
        ["."] = true,
      },
    })
  end,
}
