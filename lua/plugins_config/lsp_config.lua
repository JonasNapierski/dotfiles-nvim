require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "" }
})

local on_attach = function(_, _)

  -- rename and code_action
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

  -- default lsp stuff 
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})

  -- Show diagnostics in floating window
  vim.keymap.set('n', 'gl', vim.diagnostic.open_float, {desc="Open Diagnostic window"})
end

local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup {
  on_attach = on_attach,
  settings = {
    diagnostics = {
      globals = {'vim'},
    },
    workspace = {
      library = vim.api.nvim_get_runtime_file("", true)
    },
    telementry = {
      enable = false,
    }
  }
}

lspconfig.csharp_ls.setup({
  on_attach = on_attach,
})

lspconfig.clangd.setup({
  on_attach = on_attach,
})

lspconfig.pylsp.setup({
  on_attach = on_attach,
})


