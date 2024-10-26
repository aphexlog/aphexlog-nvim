 -- Basic Neovim settings
vim.opt.number = true            -- Show line numbers
vim.opt.relativenumber = true    -- Relative line numbers
vim.opt.expandtab = true         -- Use spaces instead of tabs
vim.opt.shiftwidth = 4           -- Indent by 4 spaces
vim.opt.tabstop = 4              -- Tab counts as 4 spaces
vim.opt.smartindent = true       -- Auto-indent new lines

-- Search
vim.opt.ignorecase = true        -- Ignore case in searches
vim.opt.smartcase = true         -- But respect case if uppercase letters used

-- UI enhancements
vim.opt.wrap = false             -- Disable line wrap
vim.opt.scrolloff = 8            -- Keep 8 lines visible above/below cursor
vim.opt.termguicolors = true     -- Enable 24-bit RGB colors

-- Set leader key
vim.g.mapleader = " "            -- Set leader key to space

-- Lazy.nvim setup
vim.opt.rtp:prepend("~/.local/share/nvim/lazy/lazy.nvim")

require("lazy").setup({
    -- Specify plugins here
    {"catppuccin/nvim"},
    { "nvim-lua/plenary.nvim" },              -- Dependency for other plugins
    { "nvim-telescope/telescope.nvim" },      -- Fuzzy finder
    { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }, -- Syntax highlighting
    { "akinsho/toggleterm.nvim", version = "*", config = true }, -- Integrated terminal
})

vim.cmd.colorscheme("catppuccin")

-- ToggleTerm configuration
require("toggleterm").setup({
    size = 20,
    open_mapping = [[<c-\>]],    -- Keybinding to toggle terminal
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "float",         -- Can be 'horizontal', 'vertical', 'tab', or 'float'
    close_on_exit = true,
    shell = vim.o.shell,         -- Uses the default shell
})
