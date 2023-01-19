local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ "wbthomason/packer.nvim" },
	{ "L3MON4D3/LuaSnip" },
	{ "neovim/nvim-lspconfig" },
	{ "karb94/neoscroll.nvim" },
	{ "numToStr/Comment.nvim" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "norcalli/nvim-colorizer.lua" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "williamboman/mason.nvim" },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{ "nvim-lua/popup.nvim" },
	{ "lukas-reineke/indent-blankline.nvim" },
	{ "windwp/nvim-autopairs" },
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lua" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-emoji" },
	{ "ellisonleao/gruvbox.nvim", requires = "rktjmp/lush.nvim" },
	{
		"hoob3rt/lualine.nvim",
		dependencies = "kyazdani42/nvim-web-devicons",
	},
	{ "folke/trouble.nvim", dependencies = "kyazdani42/nvim-web-devicons" },
	{ "anuvyklack/pretty-fold.nvim" },
	{
		"iamcco/markdown-preview.nvim",
		build = function() vim.fn["mkdp#util#install"]() end,
	},
	{ "kylechui/nvim-surround" },
	{ "j-hui/fidget.nvim" },
	{ "https://git.sr.ht/~whynothugo/lsp_lines.nvim" },
	{ "mzlogin/vim-markdown-toc" },
	-- Icebox
	-- { "lewis6991/impatient.nvim" },
})

-- require("impatient")

require("plugins.cmp")
require("plugins.lspconfig")
require("plugins.colorizer")
require("plugins.comment")
require("plugins.fidget")
require("plugins.lualine")
require("plugins.mason")
require("plugins.neoscroll")
require("plugins.nvim-surround")
require("plugins.nvim-treesitter")
require("plugins.nvim-autopairs")
require("plugins.pretty-fold")
require("plugins.telescope")
require("plugins.trouble")
