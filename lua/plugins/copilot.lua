-- Lets go ahead and configure copilot for neovim, this is the copilot.lua file
return {
  "zbirenbaum/copilot.lua",

  config = function()
    require("copilot").setup()

    filetypes = {
      -- Web Development
      "typescript",
      "javascript",
      "typescriptreact",
      "javascriptreact",
      "html",
      "css",
      "scss",
      "vue",
      "svelte",
      
      -- Programming Languages
      "python",
      "lua",
      "ruby",
      "go",
      "rust",
      "java",
      "cpp",
      "c",
      "csharp",
      "php",
      
      -- Data & Config
      "json",
      "yaml",
      "toml",
      "xml",
      
      -- Shell & Scripts
      "bash",
      "fish",
      "zsh",
      "sh",
      
      -- Documentation
      "markdown",
      "mdx",
      
      -- DevOps & Infrastructure
      "dockerfile",
      "docker-compose",
      "terraform",
      "hcl",
      "kubernetes",
      
      -- Version Control & CI
      "gitignore",
      "gitcommit",
      "github-actions-yaml",
      "gitlab-ci",
      
      -- Editors & IDE
      "vim",
      "neovim",
      
      -- Database
      "sql",
      "plsql",
      "mongodb",
      
      -- Others
      "conf",
      "ini",
      "env"
    }
  end,
}
