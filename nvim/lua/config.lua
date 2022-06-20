require("packer").startup(function()
    local use = require("packer").use
    use({ "L3MON4D3/LuaSnip" })
    use({ "neovim/nvim-lspconfig" })
    use({ "karb94/neoscroll.nvim" })
    use({ "numToStr/Comment.nvim" })
    use({ "saadparwaiz1/cmp_luasnip" })
    use({ "norcalli/nvim-colorizer.lua" })
    use({
        "nvim-telescope/telescope.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    })
    use({ "nvim-lua/popup.nvim" })
    use({ "lukas-reineke/indent-blankline.nvim" })
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use({ "hrsh7th/nvim-cmp" })
    use({ "hrsh7th/cmp-nvim-lua" })
    use({ "hrsh7th/cmp-nvim-lsp" })
    use({ "hrsh7th/cmp-path" })
    use({ "hrsh7th/cmp-emoji" })
    use({ "ellisonleao/gruvbox.nvim", requires = "rktjmp/lush.nvim" })
    use({
        "hoob3rt/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })
    use({ "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" })

    -- vimscript
    use({ "jiangmiao/auto-pairs" })
    use({ "tpope/vim-surround" })
    use({ "j-hui/fidget.nvim" })
end)

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.colors_name = "gruvbox"

vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
vim.bo.expandtab = true

vim.wo.number = true
vim.wo.list = true
vim.wo.relativenumber = true
vim.wo.signcolumn = "number"

vim.opt.writebackup = false
vim.opt.showcmd = true
vim.opt.mouse = "a"
vim.opt.hidden = true
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
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Move this to a new autogroups file
vim.cmd [[au TextYankPost * silent! lua vim.highlight.on_yank()]]
