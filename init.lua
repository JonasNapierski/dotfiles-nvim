require('plugins')
require('jpudel')
require("plugins_config")

local set = vim.opt

-- set the behavior of tab
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true

set.number = true
set.relativenumber = true

vim.cmd.colorscheme("carbonfox")
