-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local merge_tb = vim.tbl_deep_extend
-- other escape sequences
keymap.set("i", "jj", "<Esc>", { desc = "alt escape" })
-- keymap.set("i", "kj", "<Esc>", { desc = "alt escape" })
keymap.set("i", "kk", "<Esc>", { desc = "alt escape" })
-- remove highlight
-- keymap.set("n", "<ESC>", "<cmd> noh <CR>", { desc = "escape with no highlight" })
-- keymap.set("n", "gf", "<cmd>edit <cfile><CR>", { desc = "go to file (create if non-existent)" })
-- buffers (handled by bufferline plugin)
-- keymap.set("n", "<leader>bq", "<cmd> bp <BAR> bd #<CR>", { desc = "close buffer" })
keymap.set("n", "<C-q>", "gqip", { desc = "hard-wrap paragraph" }) -- hard-wrap paragraph text
-- keymap.set("n", "<leader>ew", "<cmd>  set nowrap <CR>", { desc = "set nowrap" }) -- set no-wrap
-- spell language
-- keymap.set("n", "<leader>scp", "<cmd> setlocal spell spelllang=pt <CR>", { desc = "set spell PT" })
-- keymap.set("n", "<leader>sce", "<cmd> setlocal spell spelllang=en_gb <CR>", { desc = "set spell EN_GB" })
-- keymap.set("n", "<leader>sca", "<cmd> setlocal spell spelllang=en_gb,pt <CR>", { desc = "set spell EN_GB + PT" })
-- line numbers
-- keymap.set("n", "<leader>en", "<cmd> set nu! <CR>", { desc = "toggle number" }) -- toggle
-- keymap.set("n", "<leader>er", "<cmd> set rnu! <CR>", { desc = "toggle relative number" }) -- toggle relative
-- move through wraps
-- keymap.set("n", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
-- keymap.set("n", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
-- keymap.set("n", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
-- keymap.set("n", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
-- visual
-- keymap.set("v", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
-- keymap.set("v", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })

-- keymap.set("x", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
-- keymap.set("x", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
-- Don't copy the replaced text after pasting in visual mode
keymap.set("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', { silent = true })
keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without updating register" })
-- indents
vim.keymap.set("v", "<", "<gv", { desc = "Stay in visual mode during outdent" })
vim.keymap.set("v", ">", ">gv", { desc = "Stay in visual mode during indent" })
-- command aliases
keymap.set("c", "W<CR>", vim.cmd.w) -- save file
keymap.set("c", "Wq<CR>", vim.cmd.wq) -- save file and quit
keymap.set("c", "WQ<CR>", vim.cmd.wq) -- save file and quit
keymap.set("c", "Q<CR>", vim.cmd.wq) -- quit file
