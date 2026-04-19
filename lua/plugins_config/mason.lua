require("mason").setup()
--
-- Capabilities for completion
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Use `vim.lsp.config` to configure servers BEFORE mason-lspconfig sets them up
vim.lsp.config.clangd = {
    capabilities = capabilities,
}
vim.lsp.enable("clangd")

vim.lsp.config.kotlin_language_server = {
    capabilities = capabilities,
}
vim.lsp.enable("kotlin_language_server")

vim.lsp.config.lua_ls = {
    capabilities = capabilities,
    settings = {
        Lua = {
            workspace = {
                checkThirdParty = false,
                library = { vim.env.VIMRUNTIME }
            }
        }
    }
}
vim.lsp.enable("lua_ls")

vim.lsp.config.cmake = {
    capabilities = capabilities,
}
vim.lsp.enable("cmake")

vim.lsp.config.jsonls = {
    capabilities = capabilities,
}
vim.lsp.enable("jsonls")

vim.lsp.config.html = {
    capabilities = capabilities,
}
vim.lsp.enable("html")

vim.lsp.config.cssls = {
    capabilities = capabilities,
}
vim.lsp.enable("cssls")

vim.lsp.config.hyprls = {
    capabilities = capabilities,
}
vim.lsp.enable("hyprls")

vim.lsp.config.ts_ls = {
    capabilities = capabilities,
}
vim.lsp.enable("ts_ls")

vim.lsp.config.basedpyright = {
    capabilities = capabilities,
}
vim.lsp.enable("basedpyright")

vim.lsp.config.qmlls = {
    capabilities = capabilities,
}
vim.lsp.enable("qmlls")

local opts = { }

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
vim.keymap.set('n', '<leader>f', function()
    vim.lsp.buf.format()
end, opts)

vim.keymap.set('n', '<leader>f', function()
    vim.lsp.buf.format()
end, opts)

local cmp = require("cmp")

cmp.setup({
  completion = {
    autocomplete = { cmp.TriggerEvent.TextChanged },
  },

  mapping = {
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { "i", "s" }),
  },

  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
  },
})

