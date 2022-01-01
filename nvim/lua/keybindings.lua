local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }

keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
