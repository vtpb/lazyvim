return {
  -- TODO: lazyload (no need to load for non-tex files)
  "lervag/vimtex",
  name = "vimtex",
  ft = { "tex", "plaintex", "bib" },
  config = function()
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_view_general_viewer = "zathura"
    vim.g.tex_comment_nospell = 1
    vim.g.tex_flavor = "latex"
    vim.g.vimtex_quickfix_mode = 0
    vim.g.vimtex_indent_enabled = 0
    vim.g.vimtex_mappings_enabled = 0
    vim.g.vimtex_imaps_enabled = 0
    vim.g.vimtex_complete_enabled = 0
    vim.g.vimtex_include_search_enabled = 0
    vim.g.vimtex_quickfix_ignore_filters = {
      "LaTeX hooks Warning",
      "Underfull \\hbox",
      "Overfull \\hbox",
      -- 'LaTeX Warning: .\+ float specifier changed to',
      'Package siunitx Warning: Detected the "physics" package:',
      "Package hyperref Warning: Token not allowed in a PDF string",
      "Fatal error occurred, no output PDF file produced!",
    }
    vim.g.vimtex_toc_config = {
      split_pos = "vert rightbelow",
      split_width = "30",
      fold_enable = 1,
    }
  end,
  keys = function()
    -- TODO: Add to whichkey
    vim.keymap.set("n", "<leader>tc", vim.cmd.VimtexCompile, { desc = "latex start compile" })
    vim.keymap.set("n", "<leader>tv", vim.cmd.VimtexView, { desc = "latex view" })
    vim.keymap.set("n", "<leader>tt", vim.cmd.VimtexTocToggle, { desc = "latex toggle ToC" })
  end,
}
