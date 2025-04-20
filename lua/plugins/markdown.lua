return {
  {
    "iamcco/markdown-preview.nvim",
    ft = { "md", "qmd" },
    config = function()
      -- use custom IP to open preview page.
      vim.g.mkdp_open_ip = ""

      -- specify browser to open preview page (WSL2, Chrome)
      vim.g.mkdp_browser = "/mnt/c/Program Files/Google/Chrome/Application/chrome.exe /incognito"
    end,
  },
}
