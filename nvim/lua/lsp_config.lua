-- function to attach completion and diagnostics
-- when setting up lsp
local on_attach = function(client)
    require'completion'.on_attach(client)
end

-- nvim_lsp object
local nvim_lsp = require'nvim_lsp'

-- Setup LSP's
nvim_lsp.rust_analyzer.setup{ on_attach=on_attach }
nvim_lsp.clangd.setup{ on_attach=on_attach }
nvim_lsp.tsserver.setup{ on_attach=on_attach }
nvim_lsp.sumneko_lua.setup{ on_attach=on_attach }
nvim_lsp.vimls.setup{ on_attach=on_attach }
nvim_lsp.yamlls.setup{ on_attach=on_attach }
