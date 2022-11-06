local M = {}

local map = vim.keymap.set

-- local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
-- if status_cmp_ok then
--   print 'oof'
--   return
-- end
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

  vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = "#FF0000", bg = "#313335" })
  vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = "#FFA500", bg = "#313335" })
  vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { fg = "#ADD8E6", bg = "#313335" })
  vim.api.nvim_set_hl(0, "DiagnosticSignHint", { fg = "#D3D3D3", bg = "#313335" })

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { text = sign.text, texthl = sign.name, numhl = "" })
  end

  local config = {
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
      focusable = true,
      border = "rounded",
      source = "always",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

end

local function lsp_highlight_document(client)
  if client.server_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.diagnostic.open_float()
      augroup END
    ]] ,
      false
    )
  end
end

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
  map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  map("n", "<leader>fm", vim.lsp.buf.format, opts)
  map("n", "gl", vim.diagnostic.open_float, opts)
  --  map("n", "gl", '<cmd>lua vim.lsp.diagnostic.show_line.diagnostics({ border = "rounded" })<CR>', opts)
  --  map("n", "[d", '<cmd>lua vim.lsp.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
  --  map("n", "]d", '<cmd>lua vim.lsp.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
  --  map("n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)

  --  vim.cmd [[ commmand! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

M.on_attach = function(client, bufnr)
  if client.name == "tsserver" then
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
  end
  if client.name == "sumneko_lua" then
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
  end
  lsp_keymaps(bufnr)
  lsp_highlight_document(client)
end

return M
