local gh = function(repo)
  return "https://github.com/" .. repo
end

vim.pack.add({
  gh("mason-org/mason.nvim"),
  gh("mason-org/mason-lspconfig.nvim"),
  gh("neovim/nvim-lspconfig"),
  gh("hrsh7th/cmp-nvim-lsp"),
  gh("hrsh7th/nvim-cmp"),
  gh("folke/lazydev.nvim"),
  gh("nvim-telescope/telescope.nvim"),
  gh("nvim-lua/plenary.nvim"),
  { src = gh("catppuccin/nvim"), name = "catppuccin" },
  gh("FabijanZulj/blame.nvim"),
  gh("nvim-lualine/lualine.nvim"),
  gh("nvim-tree/nvim-web-devicons"),
  gh("Ilyasyoy/coredor.nvim"),
  gh("godlygeek/tabular"),
  gh("preservim/vim-markdown"),
  gh("nvim-treesitter/nvim-treesitter"),
  gh("NeogitOrg/neogit"),
  { src = gh("nvim-neo-tree/neo-tree.nvim"), version = "v3.x" },
  gh("MunifTanjim/nui.nvim"),
  gh("3rd/image.nvim"),
  gh("mfussenegger/nvim-dap"),
  gh("mfussenegger/nvim-dap-python"),
  gh("rcarriga/nvim-dap-ui"),
  gh("nvim-neotest/nvim-nio"),
  gh("nyoom-engineering/oxocarbon.nvim"),
})
