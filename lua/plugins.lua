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
    }
end)

