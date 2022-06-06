local nvim_treesitter_config = require('nvim-treesitter.configs')

nvim_treesitter_config.setup {
    ensure_installed = { "c", "rust", "lua", "javascript", "json" },
    indent = {
        enable = true
    },
    highlight = {
        enable = true,
    }
}
