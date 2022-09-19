local opts = { noremap = true, silent = false }

local telescope = require('telescope.builtin')

vim.keymap.set("n", "<leader>ff", telescope.find_files, opts)
vim.keymap.set("n", "<leader>fg", telescope.live_grep, opts)
vim.keymap.set("n", "<leader>fb", telescope.buffers, opts)
vim.keymap.set("n", "<leader>fh", telescope.help_tags, opts)
