vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.colors_name = "gruvbox"

vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
vim.bo.expandtab = true
vim.bo.autoindent = true
vim.bo.smartindent = true

vim.wo.number = true
vim.wo.list = true
vim.wo.relativenumber = true
vim.wo.signcolumn = "number"

vim.wo.foldcolumn = "1"
vim.wo.foldlevel = 50
vim.wo.foldenable = true

vim.opt.writebackup = false
vim.opt.showcmd = true
vim.opt.mouse = "a"
vim.opt.hidden = true
vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.opt.backspace = "indent,eol,start"
vim.opt.background = "dark"
vim.opt.lazyredraw = true
vim.opt.termguicolors = true
vim.opt.swapfile = true
vim.opt.undofile = true
vim.opt.laststatus = 3
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.scrolloff = 5
vim.opt.numberwidth = 4
vim.opt.colorcolumn = "80"
vim.opt.showmode = false
vim.opt.splitbelow = true
vim.opt.splitright = true

--Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force to select one from the menu
-- shortness: avoid showing extra messages when using completion
-- updatetime: set updatetime for CursorHold
vim.opt.completeopt = { "menuone", "noselect", "noinsert" }

-- Move this to a new autogroups file
vim.cmd [[au TextYankPost * silent! lua vim.highlight.on_yank()]]
vim.api.nvim_set_option("updatetime", 4000)
