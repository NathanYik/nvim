local servers = {
	"sumneko_lua",
	"cssls",
	"html",
	"jsonls",
	"tsserver",
	"emmet_ls",
	"marksman",
}

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}
	server = vim.split(server, "@", { trimempty = true })[1]

	local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", opts, conf_opts)
	end

	--[[ if server == "tsserver" then ]]
	--[[ 	require("typescript").setup({ ]]
	--[[ 		disable_commands = true, ]]
	--[[ 		server = opts, ]]
	--[[ 	}) ]]
	--[[ else ]]
	lspconfig[server].setup(opts)
	--[[ end ]]
end
