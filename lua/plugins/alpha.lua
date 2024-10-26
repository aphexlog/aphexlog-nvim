return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- Load alpha with error handling
    local status_ok, alpha = pcall(require, "alpha")
    if not status_ok then
      return
    end

    -- Setup dashboard theme
    local dashboard = require("alpha.themes.dashboard")

    -- Custom header with ASCII art and a welcome message
    dashboard.section.header.val = {
      " Welcome back to the matrix, Aphexlog",
      [[          ▀████▀▄▄              ▄█ ]],
      [[            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ]],
      [[    ▄        █          ▀▀▀▀▄  ▄▀  ]],
      [[   ▄▀ ▀▄      ▀▄              ▀▄▀  ]],
      [[  ▄▀    █     █▀   ▄█▀▄      ▄█    ]],
      [[  ▀▄     ▀▄  █     ▀██▀     ██▄█   ]],
      [[   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ]],
      [[    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ]],
      [[   █   █  █      ▄▄           ▄▀   ]],
    }

    -- Button configuration
    dashboard.section.buttons.val = {
      dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
      dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
      dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
      dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.vim<CR>"),
      dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
    }

    -- Footer setup with a custom message
    local function footer()
      return "Don't Stop Until You are Proud..."
    end
    dashboard.section.footer.val = footer()

    -- Setting highlight groups
    dashboard.section.header.opts.hl = "Include"
    dashboard.section.buttons.opts.hl = "Keyword"
    dashboard.section.footer.opts.hl = "Type"

    -- Additional options and setup
    dashboard.opts.opts.noautocmd = true

    -- Initialize alpha with the configured dashboard
    alpha.setup(dashboard.opts)
  end,
}
