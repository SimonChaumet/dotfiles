vim.keymap.set({ "n", "v" }, "<space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>p", "\"+P")
vim.keymap.set("n", "<leader><enter>", "<cmd>w! | !compiler %<CR>")
vim.keymap.set("n", "<leader>u", function() require("packer").sync() end)

-- telescope
vim.keymap.set("n", "<leader>tf",
    function() require("telescope.builtin").find_files() end)
vim.keymap.set("n", "<leader>tb",
    function() require("telescope.builtin").buffers() end)
vim.keymap.set("n", "<leader>tg",
    function() require("telescope.builtin").grep_string() end)
vim.keymap.set("n", "<leader>tl",
    function() require("telescope.builtin").live_grep() end)
