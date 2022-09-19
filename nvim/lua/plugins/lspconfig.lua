local updated_capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

updated_capabilities.textDocument.completion.completionItem.snippetSupport = true
updated_capabilities.textDocument.completion.completionItem.insertReplaceSupport = false
updated_capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	local bufopts = { noremap = true, silent = false, buffer = bufnr }

	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<space>f", vim.lsp.buf.formatting, bufopts)

	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
				vim.lsp.buf.formatting_sync()
			end,
		})
	end
end

local lspconfig = require("lspconfig")

lspconfig.rust_analyzer.setup({
	on_attach = on_attach,
	capabilities = updated_capabilities,
	settings = {
		["rust-analyzer"] = {
			assist = {
				importGranularity = "module",
				importPrefix = "self",
			},
			cargo = {
				features = "all",
				loadOutDirsFromCheck = true,
			},
			procMacro = {
				enable = true,
			},
		},
	},
})

lspconfig.pyright.setup({
	on_attach = on_attach,
	capabilities = updated_capabilities,
})

lspconfig.clangd.setup({
	on_attach = on_attach,
	capabilities = updated_capabilities,
})

lspconfig.tsserver.setup({
	filetypes = { "javascript", "typescript", "typescriptreact" },
	on_attach = on_attach,
	capabilities = updated_capabilities,
})

lspconfig.svelte.setup({
	on_attach = on_attach,
	capabilities = updated_capabilities,
})

lspconfig.sumneko_lua.setup({
	settings = {
		Lua = {
			format = {
				enable = true,
				defaultConfig = {
					quote_style = "double",
				}
			},
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
	on_attach = on_attach,
	capabilities = updated_capabilities,
})

lspconfig.gopls.setup({})
