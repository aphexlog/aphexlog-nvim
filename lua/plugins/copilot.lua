return {
  "zbirenbaum/copilot.lua",
  config = function()
    -- Initialize copilot state
    local copilot_enabled = true
    -- Define the configuration
    local copilot_config = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        hide_during_completion = true,
        debounce = 75,
        keymap = {
          accept = "<C-M-j>",
          accept_word = "<C-M-k>",
          accept_line = "<C-M-l>",
          next = "<C-M-n>",
          prev = "<C-M-p>",
          dismiss = "<C-M-h>",
        },
      },
      panel = {
        enabled = true,
        auto_refresh = true,
        keymap = {
          toggle = "<C-M-m>",
        },
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
    }

    -- Initial setup
    require("copilot").setup(copilot_config)

    -- Toggle function for Copilot
    function ToggleCopilot()
      if copilot_enabled then
        vim.cmd("Copilot disable")
        -- Disable suggestions when turning off
        require("copilot.suggestion").toggle_auto_trigger()
        vim.notify("Copilot Disabled", vim.log.levels.INFO)
      else
        vim.cmd("Copilot enable")
        -- Re-enable suggestions when turning on
        require("copilot.suggestion").toggle_auto_trigger()
        vim.notify("Copilot Enabled", vim.log.levels.INFO)
      end
      copilot_enabled = not copilot_enabled
    end

    -- Map F12 to toggle Copilot in insert and normal modes
    vim.keymap.set({ "i", "n" }, "<F12>", function()
      ToggleCopilot()
    end, { noremap = true, silent = true })
  end,
}
