if true then
  return {}
end
return {
  -- "epwalsh/obsidian.nvim",
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  -- ft = "markdown",
  event = {
    "BufReadPre " .. vim.fn.expand("~") .. "/obsidian/**.md",
    "BufNewFile " .. vim.fn.expand("~") .. "/obsidian/**.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  -- TODO: Obsidian class in whichkey
  config = function(_, opts)
    vim.keymap.set("n", "gf", function()
      if require("obsidian").util.cursor_on_markdown_link() then
        return "<cmd>ObsidianFollowLink<CR>"
      else
        return "gf"
      end
    end, { noremap = false, expr = true, desc = "go to file or Obsidian note" })
    vim.keymap.set({ "n" }, "<leader>oo", "<cmd>ObsidianOpen<CR>", { desc = "open Obsidian.md" })
    require("core.mappings").obsidian()
  end,
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/vaults/personal",
        overrides = {
          -- keep notes in specific subdirectory of vault
          notes_subdir = "inbox",
          daily_notes = {
            folder = "journal",
            -- date format specified by Python strftime format
            -- https://docs.python.org/3/library/datetime.html#strftime-and-strptime-behavior
            -- instead of form used in Obsidian
            date_format = "%Y-%m-%d_%a",
            template = "templates/daily_note",
          },
        },
      },
      {
        name = "work",
        path = "~/vaults/work",
        overrides = {
          -- keep notes in specific subdirectory of vault
          notes_subdir = "inbox",
          daily_notes = {
            folder = "journal",
            -- date format specified by Python strftime format
            -- https://docs.python.org/3/library/datetime.html#strftime-and-strptime-behavior
            -- instead of form used in Obsidian
            date_format = "%Y-%m-%d_%a",
            template = "templates/daily_note",
          },
        },
      },
      -- {
      --   name = "my_vault",
      --   path = "~/obsidian/vault",
      --   -- following settings override the defaults for specific vaults
      --   -- can be used outside of "workspaces" to specify defaults
      --   overrides = {
      --     -- keep notes in specific subdirectory of vault
      --     notes_subdir = "000_inbox",
      --     daily_notes = {
      --       folder = "100_personal/101_journal",
      --       -- date format specified by Python strftime format
      --       -- https://docs.python.org/3/library/datetime.html#strftime-and-strptime-behavior
      --       -- instead of form used in Obsidian
      --       date_format = "%Y-%m-%d_%a",
      --       template = "templates/daily_note",
      --     },
      --   },
      -- },
    },

    -- key mappings. set 'mappings = {}' for no mappings
    mappings = {
      -- Toggle check-boxes.
      ["<leader>oc"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
    },

    disable_frontmatter = false,

    -- TODO: customise to my obsidian setup
    -- Optional, alternatively you can customize the frontmatter data.
    ---@return table
    note_frontmatter_func = function(note)
      -- Add the title of the note as an alias.
      if note.title then
        note:add_alias(note.title)
      end

      local out = { id = note.id, aliases = note.aliases, tags = note.tags }

      -- `note.metadata` contains any manually added fields in the frontmatter.
      -- So here we just make sure those fields are kept in the frontmatter.
      if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
        for k, v in pairs(note.metadata) do
          out[k] = v
        end
      end

      return out
    end,

    -- templates
    templates = {
      subdir = "templates",
      -- date_format = "%Y-%m-%d",
      -- time_format = "%H:%M",
      date_format = "%A, %B %d %Y",
      time_format = "%H:%M:%S",
      -- A map for custom variables, the key should be the variable and the value a function
      substitutions = {},
    },

    -- TODO: for WSL?
    -- by default when you use `:ObsidianFollowLink` on a link to an external
    -- URL it will be ignored but you can customize this behavior here.
    follow_url_func = function(url)
      -- Open the URL in the default web browser.
      -- vim.fn.jobstart({"open", url})  -- Mac OS
      vim.fn.jobstart({ "xdg-open", url }) -- linux
      -- vim.cmd(':silent exec "!start ' .. url .. '"') -- Windows
      -- vim.ui.open(url) -- need Neovim 0.10.0+
    end,

    open_app_foreground = true,
    -- TODO: use snacks picker (not implemented yet)
    picker = {
      -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
      name = "fzf-lua",
      -- Optional, configure key mappings for the picker. These are the defaults.
      -- Not all pickers support all mappings.
      note_mappings = {
        new = "<C-x>", -- Create a new note from your query.
        insert_link = "<C-l>", -- Insert a link to the selected note.
      },
      tag_mappings = {
        tag_note = "<C-x>", -- Add tag(s) to current note.
        insert_tag = "<C-l>", -- Insert a tag at the current location.
      },
    },

    -- Optional, determines how certain commands open notes. The valid options are:
    open_notes_in = "current", -- "current" (the default), "vsplit", "hsplit"

    attachments = {
      img_folder = "attachments",
    },
  },
}
