local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }

vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
