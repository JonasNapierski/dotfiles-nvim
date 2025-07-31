--
-- Capabilities for completion
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Common on_attach function
local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<c-s>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format({ async = true }) end, opts)


    vim.keymap.set('i', '<Tab>', function()
        return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
    end, { expr = true })

    vim.keymap.set('i', '<S-Tab>', function()
        return vim.fn.pumvisible() == 1 and "<C-p>" or "<S-Tab>"
    end, { expr = true })

    vim.keymap.set('i', '<CR>', function()
        return vim.fn.pumvisible() == 1 and "<C-y>" or "<CR>"
    end, { expr = true })

    vim.keymap.set('i', '<c-space>', function()
        vim.lsp.completion.get()
    end)

end

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('my.lsp', {}),
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true})
        end
    end,
})

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
vim.lsp.config.omnisharp = {
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

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

-- Init mason and mason-lspconfig LAST
require("mason-lspconfig").setup()
