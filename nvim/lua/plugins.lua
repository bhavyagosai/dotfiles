require("packer").startup(function()
	local use = require("packer").use
	use({ "L3MON4D3/LuaSnip" })
	use({ "neovim/nvim-lspconfig" })
	use({ "karb94/neoscroll.nvim" })
	use({ "numToStr/Comment.nvim" })
	use({ "saadparwaiz1/cmp_luasnip" })
	use({ "norcalli/nvim-colorizer.lua" })
	use({ "williamboman/mason-lspconfig.nvim" })
	use({ "williamboman/mason.nvim" })

	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use({ "nvim-lua/popup.nvim" })
	use({ "lukas-reineke/indent-blankline.nvim" })
	use({ "windwp/nvim-autopairs" })
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({ "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-nvim-lua" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-emoji" })
	use({ "ellisonleao/gruvbox.nvim", requires = "rktjmp/lush.nvim" })
	use({
		"hoob3rt/lualine.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	})
	use({ "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" })
	use({ "anuvyklack/pretty-fold.nvim" })
	use({
		"iamcco/markdown-preview.nvim",
		run = function() vim.fn["mkdp#util#install"]() end,
	})
	use({ "kylechui/nvim-surround" })
	use({ "j-hui/fidget.nvim" })
	use({
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	})
	-- Icebox
	-- use({ "lewis6991/impatient.nvim" })
end)

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
