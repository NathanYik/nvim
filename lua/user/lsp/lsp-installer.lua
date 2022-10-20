local servers = {
  "sumneko_lua",
  "cssls",
  "html",
  "jsonls",
  "tsserver",
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

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }
  server = vim.split(server, "@")[1]

  local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
  if require_ok then
    opts = vim.tbl_deep_extend("force", conf_opts, opts)
  end

  lspconfig[server].setup(opts)
end

-- local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
-- if not status_ok then
--   return
-- end
-- lsp_installer.setup {}
-- 
-- lsp_installer.on_server_ready(function(server)
--   local opts = {
--     on_attach = require("user.lsp.handlers").on_attach,
--     capabilities = require("user.lsp.handlers").capabilities,
--   }
-- 
--   if server.name == "jsonls" then
--     local jsonls_opts = require("user.lsp.settings.jsonls")
--     opts = vim.tbl_deep_extend("force", jsonls_opts, opts )
--   end
-- 
--   if server.name == "sumneko_lua" then
--     local sumneko_lua = require("user.lsp.settings.sumneko_lua")
--     opts = vim.tbl_deep_extend("force", sumneko_opts, opts )
--   end
-- 
--   server:setup(opts)
-- end)
