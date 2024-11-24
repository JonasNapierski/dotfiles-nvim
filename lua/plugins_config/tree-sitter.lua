require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c_sharp", "lua", "javascript", "c", "cmake", "dockerfile", "python", "css", "xml", "html", "json" }, -- List all languages you want to install
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
  },
  textobjects = {
    enable = true,
  },
}

