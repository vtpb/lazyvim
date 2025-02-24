return {
  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        "luadoc",
        "vim",
        "regex",
        "bash",
        -- "c",
        "python",
        -- "latex", -- some issues
        "bibtex",
        "markdown", -- required for obsidian.nvim
        "markdown_inline", -- required for obsidian.nvim
        "diff",
        "gitcommit",
        "vimdoc",
        "dockerfile",
        "fortran",
        "toml",
        "yaml",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    },
  },
}
