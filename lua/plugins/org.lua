return {
  {
    -- NOTE: treesitter setup:
    -- : TSUninstall org
    -- :lua require('orgmode.config'):reinstall_grammar()
    "nvim-orgmode/orgmode",
    dependencies = {
      -- TODO: No support yet for snacks.picker https://github.com/nvim-orgmode/telescope-orgmode.nvim/issues/29
      -- "nvim-telescope/telescope.nvim",
      -- "nvim-orgmode/telescope-orgmode.nvim",
      -- "nvim-orgmode/org-bullets.nvim",
      -- "Saghen/blink.cmp",

      -- improved rendering (still supported but no longer has new features)
      --  TODO:: disable render-markdown for org files. Enable this only for org files.
      -- TODO: check render-markdown.nvim: https://github.com/MeanderingProgrammer/render-markdown.nvim/discussions/359
      -- I find that it works pretty poorly for org-mode files. Maybe conflicting with render-markdown
      -- {
      --   "lukas-reineke/headlines.nvim",
      --   ft = { "org" },
      --   dependencies = "nvim-treesitter/nvim-treesitter",
      --   -- config = true, -- or `opts = {}`
      -- },
    },
    event = "VeryLazy",
    ft = { "org" },
    config = function()
      require("orgmode").setup({
        org_agenda_files = "~/work/vaults/org-test/**/*.org",
        org_default_notes_file = "~/work/vaults/org-test/refile.org",
        -- configurations from BartSte (https://github.com/BartSte/dotfiles/blob/master/dotfiles/nvim/lua/config/orgmode.lua)
        org_blank_before_new_entry = { heading = true, plain_list_item = false },
        org_hide_emphasis_markers = true,
        win_split_mode = "auto",
        org_todo_keywords = { "TODO", "MEET", "NEXT(n)", "WAIT", "|", "DONE(d)", "CANCEL" },
        -- org_capture_templates = templates,
        org_todo_keyword_faces = {
          WAIT = ":foreground orange :weight bold",
          NEXT = ":foreground yellow :weight bold",
          CANCEL = ":foreground magenta :weight bold",
        },
      })

      -- setup bullets
      -- require("org-bullets").setup()
      -- setup blink
      require("blink.cmp").setup({
        sources = {
          per_filetype = {
            org = { "orgmode" },
          },
          providers = {
            orgmode = {
              name = "Orgmode",
              module = "orgmode.org.autocompletion.blink",
              fallbacks = { "buffer" },
            },
          },
        },
      })
      -- require("headlines").setup()
      require("which-key").add({
        { "<leader>o", group = "org" }, -- group
      })

      -- if using telescope
      -- require("telescope").setup()
      -- require("telescope").load_extension("orgmode")
      -- vim.keymap.set("n", "<leader>r", require("telescope").extensions.orgmode.refile_heading)
      -- vim.keymap.set("n", "<leader>fh", require("telescope").extensions.orgmode.search_headings)
      -- vim.keymap.set("n", "<leader>li", require("telescope").extensions.orgmode.insert_link)
    end,
  },

  {
    "chipsenkbeil/org-roam.nvim",
    tag = "0.1.1",
    -- ft = { "org" },
    dependencies = {
      {
        "nvim-orgmode/orgmode",
        tag = "0.3.7",
      },
    },
    config = function()
      require("org-roam").setup({
        -- FIXME: it creates a '~' directory in my home
        -- FIXME: Keymaps conflict w/ notification history in LazyVim
        directory = "~/work/vaults/org-test",
      })
      require("which-key").add({
        { "<leader>n", group = "nodes (org-roam)" }, -- group
        { "<leader>na", group = "alias" }, -- group
        { "<leader>nd", group = "dailies" }, -- group
        { "<leader>no", group = "origin" }, -- group
      })
      require("blink.cmp").setup({
        enabled = function()
          -- adapted from https://github.com/chipsenkbeil/org-roam.nvim/blob/main/DOCS.org#disable-nvim-cmp-completion-in-select-buffer
          -- FIXME: despite this 'fix', completion sources still appear
          local buftype = vim.api.nvim_get_option_value("buftype", { buf = 0 })
          if buftype == "nofile" then
            return false
          end
        end,
      })
    end,
  },

  -- better agenda display
  -- {
  --   "danilshvalov/org-modern.nvim",
  --   ft = { "org" },
  --   dependencies = {
  --     { "nvim-orgmode/orgmode" },
  --   },
  --   config = function()
  --     local Menu = require("org-modern.menu")
  --
  --     require("orgmode").setup({
  --       ui = {
  --         menu = {
  --           handler = function(data)
  --             Menu:new({
  --               window = {
  --                 margin = { 1, 0, 1, 0 },
  --                 padding = { 0, 1, 0, 1 },
  --                 title_pos = "center",
  --                 border = "single",
  --                 zindex = 1000,
  --               },
  --               icons = {
  --                 separator = "➜",
  --               },
  --             }):open(data)
  --           end,
  --         },
  --       },
  --     })
  --   end,
  -- },
}
