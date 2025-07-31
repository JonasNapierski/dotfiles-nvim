-- Optional: Enable Mason UI icons
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

-- Capabilities for completion
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Common on_attach function
local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format({ async = true }) end, opts)
end

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
vim.lsp.config.omnisharp = {
    on_attach = on_attach,
    capabilities = capabilities,
}
vim.lsp.config.tsserver = {
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        on_attach(client, bufnr)
    end,
    capabilities = capabilities,
}

-- Manually configure systemd_ls (not in mason)
local configs = require("lspconfig.configs")
if not configs.systemd_ls then
    configs.systemd_ls = {
        default_config = {
            cmd = { "systemd-language-server" },
            filetypes = { "systemd" },
            root_dir = function() return nil end,
            single_file_support = true,
        },
        docs = {
            description = "https://github.com/psacawa/systemd-language-server",
        },
    }
end
require("lspconfig").systemd_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

-- Manually configure basedpyright (still not auto-installed)
require("lspconfig").basedpyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

-- Init mason and mason-lspconfig LAST
require("mason-lspconfig").setup()

