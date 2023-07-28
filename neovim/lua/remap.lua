vim.g.mapleader = " "
-- Go back to explorer
vim.keymap.set("n", "<leader>pv", ":Neotree reveal=true<CR>")

-- Move lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- When moving halfpage keep curson in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- When searching keep cursor in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste but keep word in buffer for later
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Replace current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Buffers
vim.keymap.set("n", "<A-Left>", ":bp<CR>")
vim.keymap.set("n", "<A-Right>", ":bn<CR>")
vim.keymap.set("n", "<A-q>", ":b#|bd#<CR>")
