return require('packer').startup(function(use)


	use "wbthomason/packer.nvim"
        use {
			'neovim/nvim-lspconfig',
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim'
	}
	use 'nvim-lua/completion-nvim'
        use 'neovim/nvim-lsp'
	use 'nvim-lua/lsp-status.nvim'
	use "EdenEast/nightfox.nvim"
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'L3MON4D3/LuaSnip'
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-lua/plenary.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }
  use {"ellisonleao/glow.nvim", config = function() require("glow").setup() end}
  use {"kristijanhusak/vim-dadbod-ui"}
  use {"tpope/vim-dadbod"}
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
end)

