local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

local luasnip_status_ok, luasnip = pcall(require, "luasnip")
if not luasnip_status_ok then
	return
end

require("luasnip.loaders.from_vscode").lazy_load()

--[[ local check_back_space = function() ]]
--[[ 	local col = cmp.col(".") - 1 ]]
--[[ 	return col == 0 or cmp.getline("."):sub(col, col):match("%s") ]]
--[[ end ]]

local kind_icons = {
	Text = "",
	Method = "",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y"] = cmp.config.disable,
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		--[[ ['<Tab>'] = cmp.mapping(function(fallback) ]]
		--[[   if cmp.visible() then ]]
		--[[     cmp.select_next_item() ]]
		--[[   elseif luasnip.expand then ]]
		--[[     luasnip.expand() ]]
		--[[   elseif luasnip.expand_or_jumpable() then ]]
		--[[     luasnip.expand_or_jump() ]]
		--[[   elseif check_back_space() then ]]
		--[[     fallback() ]]
		--[[   else ]]
		--[[     fallback() ]]
		--[[   end ]]
		--[[ end, { 'i', 's' }), ]]
		--[[ ['<S-Tab>'] = cmp.mapping(function(fallback) ]]
		--[[   if cmp.visible() then ]]
		--[[     cmp.select_prev_item() ]]
		--[[   elseif luasnip.jumpable(-1) then ]]
		--[[     luasnip.jump(-1) ]]
		--[[   else ]]
		--[[     fallback() ]]
		--[[   end ]]
		--[[ end, { 'i', 's' }), ]]
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
			vim_item.menu = ({
				luasnip = "[Snippet]",
				nvim_lsp = "[LSP]",
				nvim_lua = "[Lua]",
				buffer = "[Buffer]",
				path = "[Path]",
			})[entry.source.name]
			return vim_item
		end,
	},
	sources = {
		{ name = "luasnip" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "buffer" },
		{ name = "path" },
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = true,
	},
	window = {
		documentation = {
			border = "rounded",
		},
	},
	experimental = {
		ghost_text = false,
	},
})
