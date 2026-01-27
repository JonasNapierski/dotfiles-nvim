-- Capabilities for completion
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Common on_attach function
local on_attach = function(client, bufnr)
end

vim.opt.completeopt = { "menuone", "noinsert", "noselect" }


-- Use `vim.lsp.config` to configure servers BEFORE mason-lspconfig sets them up
vim.lsp.config.clangd = {
    on_attach = on_attach,
    capabilities = capabilities,
}
vim.lsp.config.kotlin_language_server = {
    on_attach = on_attach,
    capabilities = capabilities,
}
vim.lsp.config.lua_ls = {
    on_attach = on_attach,
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

vim.lsp.config.cmake = {
    on_attach = on_attach,
    capabilities = capabilities,
}
vim.lsp.config.jsonls = {
    on_attach = on_attach,
    capabilities = capabilities,
}
vim.lsp.config.html = {
    on_attach = on_attach,
    capabilities = capabilities,
}
vim.lsp.config.cssls = {
    on_attach = on_attach,
    capabilities = capabilities,
}
vim.lsp.config.hyprls = {
    on_attach = on_attach,
    capabilities = capabilities,
}

vim.lsp.config.ts_ls = {
    on_attach = on_attach,
    capabilities = capabilities,
}
vim.lsp.config.basedpyright = {
    on_attach = on_attach,
    capabilities = capabilities,
}

vim.lsp.config.qmlls = {
    on_attach = on_attach,
    capabilities = capabilities,
}


local opts = { }

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
vim.keymap.set('n', '<leader>f', function()
    vim.lsp.buf.format({ async = true })
end, opts)


require("easy-dotnet").setup({
  roslyn = {
    capabilities = capabilities,
    on_attach = on_attach,
  },
})


require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
  handlers = {
    function(server_name)
      vim.lsp.enable(server_name)
    end,
  },
})


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

