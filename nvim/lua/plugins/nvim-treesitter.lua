local nvim_treesitter_config = require("nvim-treesitter.configs")

nvim_treesitter_config.setup({
        ensure_installed = { "c", "rust", "lua", "javascript", "json", "toml" },
        auto_install = true,
        indent = { enable = true },
        rainbow = {
                enable = true,
                extended_mode = true,
                max_file_lines = nil,
        },
        highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
        },
        ident = { enable = true },
})
