local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.select_next_item(),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-y>"] = cmp.config.disable,
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true
		}),
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
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "nvim_lua" },
		{ name = "path" },
		{ name = "emoji" },
	}, {
		{ name = "buffer" },
	}),
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	experimental = {
		native_menu = false,
		ghost_text = true,
	},
	formatting = {
		fields = { 'menu', 'abbr', 'kind' },
		format = function(entry, item)
			local menu_icon = {
				nvim_lsp = 'λ',
				vsnip = '⋗',
				buffer = 'Ω',
				path = '🖫',
			}
			item.menu = menu_icon[entry.source.name]
			return item
		end,
	},
})
