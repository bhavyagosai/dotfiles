require("packer").startup(function ()
    local use = require("packer").use
    use { 'L3MON4D3/LuaSnip' }
    use { 'neovim/nvim-lspconfig' }
    use { 'karb94/neoscroll.nvim' }
    use { 'numToStr/Comment.nvim' }
    use { 'saadparwaiz1/cmp_luasnip' }
    use { 'norcalli/nvim-colorizer.lua' }
    use {
        'nvim-telescope/telescope.nvim',
        requires = {'nvim-lua/plenary.nvim'}
    }
    use { 'nvim-lua/popup.nvim' }
    use { 'lukas-reineke/indent-blankline.nvim' }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/cmp-nvim-lua' }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-emoji' }
    use { 'ellisonleao/gruvbox.nvim', requires = 'rktjmp/lush.nvim' }
    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use { 'jose-elias-alvarez/null-ls.nvim' }
    use { 'MunifTanjim/prettier.nvim' }

    -- vimscript
    use { 'jiangmiao/auto-pairs' }
    use { 'tpope/vim-surround' }
end)

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.colors_name = 'gruvbox'

vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
vim.bo.expandtab = true

vim.wo.number = true
vim.wo.list = true
vim.wo.relativenumber = true
vim.wo.signcolumn = 'yes'

vim.opt.writebackup = false
vim.opt.showcmd = true
vim.opt.mouse = 'a'
vim.opt.hidden = true
vim.opt.backspace = 'indent,eol,start'
vim.opt.background = 'dark'
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
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

local cmp = require("cmp")

cmp.setup {
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable,
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        -- ['<Tab>'] = function(fallback)
        --     if cmp.visible() then
        --         cmp.select_next_item()
        --     elseif luasnip.expand_or_jumpable() then
        --         luasnip.expand_or_jump()
        --     else
        --         fallback()
        --     end
        -- end,
        -- ['<S-Tab>'] = function(fallback)
        --     if cmp.visible() then
        --         cmp.select_prev_item()
        --     elseif luasnip.jumpable(-1) then
        --         luasnip.jump(-1)
        --     else
        --         fallback()
        --     end
        -- end,
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'nvim_lua' },
      { name = 'path' },
      { name = 'emoji' },
    }, {
        { name = 'buffer' },
    }),

    experimental = {
        native_menu = false,
        ghost_text = true,
    },
}

local updated_capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
updated_capabilities.textDocument.completion.completionItem.insertReplaceSupport = false

require('colorizer').setup()
require('lualine').setup()

require('telescope').setup {
  defaults = require('telescope.themes').get_dropdown {},
}

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
    local opts = { noremap = true, silent = false }

    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
end

local system_name
if vim.fn.has('mac') == 1 then
    system_name = 'macOS'
elseif vim.fn.has('unix') == 1 then
    system_name = 'Linux'
elseif vim.fn.has('win32') == 1 then
    system_name = 'Windows'
else
    print('Unsupported system for sumneko')
end

local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

local lspconfig = require('lspconfig')
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lspconfig.rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = updated_capabilities,
    settings = {
        ["rust-analyzer"] = {
            checkOnSave = {
                command = "clippy"
            },
        }
    }
}

lspconfig.pyright.setup {
    on_attach = on_attach,
    capabilities = updated_capabilities,
}

lspconfig.clangd.setup {
    on_attach = on_attach,
    capabilities = updated_capabilities,
}

lspconfig.tsserver.setup{
    filetypes = { 'javascript', 'typescript', 'typescriptreact' },
    on_attach = on_attach,
    capabilities = updated_capabilities,
}

lspconfig.svelte.setup{
    on_attach = on_attach,
    capabilities = updated_capabilities,
}

lspconfig.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = runtime_path,
            },
            diagnostics = {
                globals = { 'vim' }
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
        },
    },
    on_attach = on_attach,
    capabilities = updated_capabilities,
}
