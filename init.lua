require('plugins')
require('jpudel')
require("plugins_config")

local set = vim.opt

-- set the behavior of tab
set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4
set.expandtab = true

set.number = true
set.relativenumber = true

set.splitright = true
vim.cmd.colorscheme("oxocarbon")
vim.opt.background = "dark"

-- disable back from lsp server
vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.signcolumn = "yes"
