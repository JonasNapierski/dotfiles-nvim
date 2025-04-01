require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require'cmp'.setup {
  sources = {
    { name = 'nvim_lsp' }
  }
}

local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true


mason_lspconfig.setup{}

vim.g.markdown_fenced_languages = {
    "ts=typescript"
}

local on_attach = function(client, bufnr)
    local opts_buffer = { noremap = true, silent = true, buffer = bufnr }
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    -- Mappings: LSP
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts_buffer)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts_buffer)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts_buffer)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts_buffer)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts_buffer)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts_buffer)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts_buffer)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts_buffer)
    vim.keymap.set('n', '<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts_buffer)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts_buffer)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts_buffer)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts_buffer)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts_buffer)
    vim.keymap.set('n', '<leader>f', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', opts_buffer)
end

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

local lsp_flags = {
    debounce_text_changes = 150,
}
lspconfig.clangd.setup({
    on_attach = on_attach,
    flags = lsp_flags,
})

lspconfig.kotlin_language_server.setup{}
lspconfig.lua_ls.setup({
    on_attach = on_attach,
    flags = lsp_flags
})
lspconfig.cmake.setup{}
lspconfig.basedpyright.setup{}
lspconfig.jsonls.setup{}
lspconfig.html.setup{
    apabilities = capabilities,
}
lspconfig.cssls.setup{}
lspconfig.hyprls.setup{}
lspconfig.csharp_ls.setup{}
lspconfig.systemd_ls.setup{}

lspconfig.denols.setup {
  on_attach = on_attach,
  root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc", "tsconfig.json"),
}
-- spconfig.emmet_language_server.setup{}


local cmp = require 'cmp'
cmp.setup {
  snippet = {
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
    ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
    -- C-b (back) C-f (forward) for snippet placeholder navigation.
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
  },
}
