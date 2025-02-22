require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>d", vim.diagnostic.open_float, { noremap = true, silent = true, desc = "floating diagnostic" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
