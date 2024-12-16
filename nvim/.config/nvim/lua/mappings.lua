require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("t", "<C-X>", "<C-\\><C-N>")
map("n", "<leader>rw", ":%s/<C-R><C-W>/<C-R><C-W>/gc<left><left><left>", { desc = "Rename word under cursor" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
