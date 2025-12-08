return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/nvim-cmp",
        "folke/lazydev.nvim"
    }
    -- @FIX currently broken i don't know why?
    -- use "eero-lehtinen/oklch-color-picker.nvim"
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-lua/plenary.nvim'
    use {
        "catppuccin/nvim",
        as = "catppuccin" }
    use "FabijanZulj/blame.nvim"
    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            'nvim-tree/nvim-web-devicons',
            opt = true
        }
    }
    use    {
        "Ilyasyoy/coredor.nvim",
    }
    use "godlygeek/tabular"
    use "preservim/vim-markdown"
    use { 'nvim-treesitter/nvim-treesitter' }
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
            "3rd/image.nvim",
        },
        config = function()
            require("neo-tree").setup({
                -- ...other options
                filesystem = {
                    window = {
                        mappings = {
                            -- Make the mapping anything you want
                            ["R"] = "easy",
                        },
                    },
                    commands = {
                        ["easy"] = function(state)
                            local node = state.tree:get_node()
                            local path = node.type == "directory" and node.path or vim.fs.dirname(node.path)
                            require("easy-dotnet").create_new_item(path, function()
                                require("neo-tree.sources.manager").refresh(state.name)
                            end)
                        end,
                    },
                },
            })
        end
    }
    use "mfussenegger/nvim-dap"
    use "mfussenegger/nvim-dap-python"
    use {
        "rcarriga/nvim-dap-ui",
        requires = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio"
        }
    }
    use "nyoom-engineering/oxocarbon.nvim"
    use {
        "GustavEikaas/easy-dotnet.nvim",
        requires = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
        config = function()
            require("easy-dotnet").setup({
                lsp = {
                    enabled = true,            -- enable easy-dotnet's Roslyn LSP
                    roslynator_enabled = false, -- optional analyzer
                    on_attach = function(client, bufnr)
                        -- first call easy-dotnet default on_attach to keep its features
                        if require("easy-dotnet").on_attach then
                            require("easy-dotnet").on_attach(client, bufnr)
                        end

                        -- then add your custom mappings (same as your `on_attach`)
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

                        -- optional insert mode mappings
                        vim.keymap.set('i', '<Tab>', function()
                            return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
                        end, { expr = true, buffer = bufnr })

                        vim.keymap.set('i', '<S-Tab>', function()
                            return vim.fn.pumvisible() == 1 and "<C-p>" or "<S-Tab>"
                        end, { expr = true, buffer = bufnr })

                        vim.keymap.set('i', '<CR>', function()
                            return vim.fn.pumvisible() == 1 and "<C-y>" or "<CR>"
                        end, { expr = true, buffer = bufnr })

                        vim.keymap.set('i', '<C-Space>', function()
                            require("cmp").complete()
                        end, { buffer = bufnr })
                    end,
                },
            })
        end
    }
end)

