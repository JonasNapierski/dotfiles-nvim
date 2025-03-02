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

lspconfig.kotlin_language_server.setup{}

lspconfig.lua_ls.setup({
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if path ~= vim.fn.stdpath('config') and (vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc')) then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT'
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = true,
        -- library = {
          -- jvim.env.VIMRUNTIME
          -- Depending on the usage, you might want to add additional paths here.
          -- "${3rd}/luv/library"
          -- "${3rd}/busted/library",
        -- }
        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
        library = vim.api.nvim_get_runtime_file("", true)
      }
    })
  end,
  settings = {
    Lua = {}
  }
})


-- Keymap helper function
local function keymap(mode, lhs, rhs, opts)
    opts = opts or { noremap = true, silent = true }
    vim.keymap.set(mode, lhs, rhs, opts)
end

-- Completion trigger (handled by nvim-cmp usually)
keymap("i", "<C-Space>", vim.lsp.buf.completion)

-- GoTo navigation
keymap("n", "gd", vim.lsp.buf.definition)
keymap("n", "gy", vim.lsp.buf.type_definition)
keymap("n", "gi", vim.lsp.buf.implementation)
keymap("n", "gr", vim.lsp.buf.references)

-- Show documentation
keymap("n", "K", vim.lsp.buf.hover)

-- Symbol highlighting on CursorHold
vim.api.nvim_create_autocmd("CursorHold", {
    callback = vim.lsp.buf.document_highlight,
    desc = "Highlight symbol under cursor on CursorHold"
})

-- Symbol renaming
keymap("n", "<leader>rn", vim.lsp.buf.rename)

-- Formatting selected region
keymap("n", "<leader>p", function()
    vim.lsp.buf.format({ async = true })
end)

-- Configure LSP servers
mason_lspconfig.setup_handlers({
    function(server_name)
        lspconfig[server_name].setup({
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
            on_attach = function(client, bufnr)
                local bufopts = { noremap = true, silent = true, buffer = bufnr }
                vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
            end
        })
    end
})

