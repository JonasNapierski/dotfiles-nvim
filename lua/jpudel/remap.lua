-- @author Jonas
-- This is my personal neovim configuration. If you want to you it checkout the github repo!
vim.g.mapleader = 't'
vim.g.maplocalleader = 't'
vim.keymap.set("n", "<leader>pv",vim.cmd.Ex, {desc="Open file explorer"})


-- Remap for german keyboard layout QWERTZ
vim.keymap.set('n', 'ö', '{', {remap = true, desc="Remap default { to german ö"})
vim.keymap.set('n', 'ä', '}', {remap = true, desc="Remap default } to german ä"})

vim.keymap.set('n', 'Ö', '[', {remap = true, desc="Remap default [ to german Ö"})
vim.keymap.set('n', 'Ä', ']', {remap = true, desc="Remap default ] to german Ä"})


-- Add a descriptions to the keymap
vim.keymap.set('n', 'I', 'I', {desc="Insert in line start"})
vim.keymap.set('n', 'A', 'A', {desc="Insert in line end (append)"})
