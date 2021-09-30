local vo = vim.o -- Global options
local vwo = vim.wo -- Window local options
local vbo = vim.bo -- Buffer local options

-- Global settings
vo.swapfile = true
vo.dir = '/tmp/nvim-swap'
vo.smartcase = true
vo.laststatus = 2
vo.hlsearch = true
vo.incsearch = true
vo.ignorecase = true
vo.scrolloff = 12

-- Window settings
vwo.relativenumber = true
vwo.wrap = false

-- Buffer settings
vbo.expandtab = true
