return require('packer').startup(function(use)
  use  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  use {
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim'
  }
end)

