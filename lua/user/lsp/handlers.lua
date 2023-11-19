local M = {}

local map = vim.keymap.set
local cmp_nvim_lsp = require("cmp_nvim_lsp")

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

M.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { text = sign.text, texthl = sign.name, numhl = "" })
	end

	local config = {
		virtual_text = false,
		signs = true,
		update_in_insert = false,
		severity_sort = true,
		float = {
			border = "rounded",
			focusable = false,
			source = true,
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

	vim.lsp.handlers["textDocument/signatureHelp"] =
		vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
end

-- vim.api.nvim_create_autocmd("CursorHold", {
-- 	pattern = "*",
-- 	command = "lua vim.diagnostic.open_float()",
-- 	group = vim.api.nvim_create_augroup("lsp_open_float_on_hover", {}),
-- })

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	command = "lua vim.lsp.buf.format()",
	group = vim.api.nvim_create_augroup("format_on_save", {}),
})

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }
	map("n", "gD", vim.lsp.buf.declaration, opts)
	map("n", "gd", vim.lsp.buf.definition, opts)
	map("n", "K", vim.lsp.buf.hover, opts)
	map("n", "gi", vim.lsp.buf.implementation, opts)
	map("n", "<C-k>", vim.lsp.buf.signature_help, opts)
	map("n", "gr", vim.lsp.buf.references, opts)
	map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
	map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
	map("n", "<leader>wl", vim.lsp.buf.list_workspace_folders, opts)
	map("n", "<leader>D", vim.lsp.buf.type_definition, opts)
	map("n", "<leader>rn", vim.lsp.buf.rename, opts)
	map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
	map("n", "<leader>fm", vim.lsp.buf.format, opts)
	map("n", "<leader>q", vim.diagnostic.setloclist, opts)
	map("n", "gl", vim.diagnostic.open_float, opts)
	map("n", "[d", vim.diagnostic.goto_prev, opts)
	map("n", "]d", vim.diagnostic.goto_next, opts)
end

M.on_attach = function(client, bufnr)
	--[[ if client.name == "tsserver" then ]]
	--[[   client.server_capabilities.document_formatting = false ]]
	--[[   client.server_capabilities.document_range_formatting = false ]]
	--[[ end ]]
	--[[ if client.name == "sumneko_lua" then ]]
	--[[   client.server_capabilities.document_formatting = false ]]
	--[[   client.server_capabilities.document_range_formatting = false ]]
	--[[ end ]]
	--[[ if client.name ~= "html" then ]]
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false
	--[[ end ]]
	lsp_keymaps(bufnr)
end

return M
