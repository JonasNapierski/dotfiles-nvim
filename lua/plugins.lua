return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-lua/plenary.nvim'
    use {
        "catppuccin/nvim",
        as = "catppuccin" }
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
    use    {"epwalsh/obsidian.nvim"}
    use "godlygeek/tabular"
    use "preservim/vim-markdown"
    use {
    "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
            "3rd/image.nvim",
        }
    }
    use {'neoclide/coc.nvim', branch = 'release'}
    use {
            "vinnymeller/swagger-preview.nvim",
            run = "npm install -g swagger-ui-watcher",
    }
    use "mfussenegger/nvim-dap"
end)

