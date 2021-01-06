-- function to attach completion and diagnostics
-- when setting up lsp
local on_attach = function(client)
    require'completion'.on_attach(client)
end

-- lspconfig object
local lspconfig = require'lspconfig'
local nvim_treesitter_config = require'nvim-treesitter.configs'
local telescope = require'telescope'

-- Setup LSP's
lspconfig.rust_analyzer.setup{ on_attach=on_attach }
lspconfig.clangd.setup{ on_attach=on_attach }
lspconfig.pyls.setup{ on_attach=on_attach }

-- Setup Treesitter
nvim_treesitter_config.setup{
        ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
        highlight = {
            enable = true,
        },
        indent = {
            enable=true
        }
    }

-- Setup Telescope
telescope.setup {
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'
        },
        prompt_position = "bottom",
        prompt_prefix = ">",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        layout_defaults = {
            -- TODO add builtin options.
        },
        file_sorter =  require'telescope.sorters'.get_fuzzy_file ,
        file_ignore_patterns = {},
        generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
        shorten_path = true,
        winblend = 0,
        width = 0.75,
        preview_cutoff = 120,
        results_height = 1,
        results_width = 0.8,
        border = {},
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
        color_devicons = true,
        use_less = true,
    }
}
